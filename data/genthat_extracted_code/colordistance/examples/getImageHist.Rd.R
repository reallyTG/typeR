library(colordistance)


### Name: getImageHist
### Title: Generate a 3D histogram based on color distribution in an image
### Aliases: getImageHist

### ** Examples

# generate HSV histogram for a single image
colordistance::getImageHist(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"),
upper=rep(1, 3), lower=rep(0.8, 3), bins=c(8, 3, 3), hsv=TRUE, plotting=TRUE)

# generate RGB histogram
colordistance::getImageHist(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"),
upper=rep(1, 3), lower=rep(0.8, 3), bins=2)



