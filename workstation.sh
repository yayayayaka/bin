#!/bin/sh
# Some magic script to setup my work environment with my docking station.
LVDS1_MODE="1600x900"
HDMI2_MODE="1920x1080"
VGA1_MODE="1280x1024"

if uname -a  | grep -i nixos >/dev/null 2>&1;
then
    # NixOS and probably others
    LVDS1="LVDS-1"
    HDMI1="HDMI-1"
    HDMI2="HDMI-2"
    HDMI3="HDMI-3"
    DP1="DP-1"
    DP2="DP-2"
    DP3="DP-3"
    VGA1="VGA-1"
    VIRTUAL1="VIRTUAL-1"
else
    # Arch Linux and probably others
    LVDS1="LVDS1"
    HDMI1="HDMI1"
    HDMI2="HDMI2"
    HDMI3="HDMI3"
    DP1="DP1"
    DP2="DP2"
    DP3="DP3"
    VGA1="VGA1"
    VIRTUAL1="VIRTUAL1"
    # ...but why, I ask.
fi

set -x
# Alternative configuration with just one external display
#xrandr \
#    --output "$LVDS1" \
#        --primary \
#        --mode "$LVDS1_MODE" \
#        --pos 0x0 \
#        --rotate normal \
#    --output "$HDMI2" \
#        --mode "$HDMI2_MODE" \
#        --right-of "$LVDS1"

xrandr \
    --output "$LVDS1" --off \
    --output "$DP1" --off \
    --output "$DP2" --off \
    --output "$DP3" --off \
    --output "$HDMI1" --off \
    --output "$HDMI2" \
        --primary \
        --mode "$HDMI2_MODE" \
        --pos 0x0 \
        --rotate normal \
    --output "$HDMI3" --off \
    --output "$VGA1" \
        --mode "$VGA1_MODE" \
        --pos 1920x0 \
        --rotate normal \
        --right-of "$VGA1" \
    --output "$VIRTUAL1" --off

i3-msg restart
