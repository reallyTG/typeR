library(colordistance)


### Name: plotImage
### Title: Display an image in a plot window
### Aliases: plotImage

### ** Examples

colordistance::plotImage(system.file("extdata",
"Heliconius/Heliconius_A/Heliconius_01.jpeg", package="colordistance"))
colordistance::plotImage(loadImage(system.file("extdata",
"Heliconius/Heliconius_A/Heliconius_01.jpeg", package="colordistance"),
lower=rep(0.8, 3), upper=rep(1, 3)))



