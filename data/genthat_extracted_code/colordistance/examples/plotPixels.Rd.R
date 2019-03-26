library(colordistance)


### Name: plotPixels
### Title: Plot pixels in color space
### Aliases: plotPixels

### ** Examples

colordistance::plotPixels(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"),
n=20000, upper=rep(1, 3), lower=rep(0.8, 3), color.space = "rgb", angle = -45)



