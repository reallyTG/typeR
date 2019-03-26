library(shades)


### Name: saturation
### Title: Query or change colour properties
### Aliases: saturation brightness lightness chroma hue opacity delta
###   scalefac recycle

### ** Examples

saturation(c("papayawhip","lavenderblush","olivedrab"))

saturation("papayawhip", 0.7)
saturation("papayawhip", delta(0.2))
saturation("papayawhip", scalefac(1.5))

saturation(c("red","green"), c(0.4,0.6))
saturation(c("red","green"), recycle(0.4,0.6))



