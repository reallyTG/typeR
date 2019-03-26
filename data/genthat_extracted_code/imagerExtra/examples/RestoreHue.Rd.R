library(imagerExtra)


### Name: RestoreHue
### Title: restore hue of color image
### Aliases: RestoreHue

### ** Examples

g <- Grayscale(boats)
hue <- GetHue(boats)
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
RestoreHue(g, hue) %>% plot(main="Resotred")



