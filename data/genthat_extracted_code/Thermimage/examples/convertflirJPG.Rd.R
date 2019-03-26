library(Thermimage)


### Name: convertflirJPG
### Title: Convert FLIR jpg into 16 bit grayscale file using shell
###   commands.
### Aliases: convertflirJPG

### ** Examples

# Based on the following command line unix code, 
# this function will convert a flir jpg into a 16 bit 
# greyscale png to import into imageJ

# Equivalent command line code:
# exiftool FLIRjpgfilename.jpg -b -RawThermalImage | convert - gray:- | 
# convert -depth 16 -endian lsb 
# -size 640x480 gray:- Outputfilename.png

# Examples
# See https://github.com/gtatters/FLIRJPGConvert/blob/master/Examples.R

# See https://github.com/gtatters/FLIRJPGConvert/blob/master/FLIRJPG_Convert.R 

# See https://github.com/gtatters/Thermimage/blob/master/README.md



