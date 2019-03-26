library(colordistance)


### Name: loadImage
### Title: Import image and generate filtered 2D pixel array(s)
### Aliases: loadImage

### ** Examples

loadedImg <- colordistance::loadImage(system.file("extdata",
"Heliconius/Heliconius_A/Heliconius_01.jpeg", package="colordistance"),
upper=rep(1, 3), lower=rep(0.8, 3))

loadedImgNoHSV <- colordistance::loadImage(system.file("extdata",
"Heliconius/Heliconius_A/Heliconius_01.jpeg", package="colordistance"),
upper=rep(1, 3), lower=rep(0.8, 3), hsv=FALSE)




