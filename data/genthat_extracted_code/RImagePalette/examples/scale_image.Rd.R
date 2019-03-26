library(RImagePalette)


### Name: scale_color_image
### Title: Image color scales
### Aliases: scale_color_image scale_colour_image scale_fill_image

### ** Examples

library(ggplot2)

# ripped from the pages of ggplot2
your_image <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
display_image(your_image)

#Discrete scale example
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(size=4, aes(colour = factor(cyl))) +
    scale_color_image(image = your_image) +
    theme_bw()

#Continuous scale example
dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
dsub$diff <- with(dsub, sqrt(abs(x-y))* sign(x-y))
d <- ggplot(dsub, aes(x, y, colour=diff)) + geom_point()
d + scale_color_image(image = your_image, discrete=FALSE) + theme_bw()



