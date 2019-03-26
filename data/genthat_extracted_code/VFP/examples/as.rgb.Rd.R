library(VFP)


### Name: as.rgb
### Title: Convert Color-Name or RGB-Code to Possibly Semi-Transparent
###   RGB-code.
### Aliases: as.rgb

### ** Examples

# convert character string representing a color to RGB-code
# using alpha-channel of .25 (75% transparent)
as.rgb("red", alpha=.25)

# same thing now using the RGB-code of red (alpha=1, i.e. as.rgb("red"))
as.rgb("#FF0000FF", alpha=.25)



