library(imagerExtra)


### Name: DCT
### Title: Two Dimensional Discrete Cosine Transformation and Inverse
###   Cosine Transformation
### Aliases: DCT DCT2D IDCT2D

### ** Examples

g <- grayscale(boats)
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
gg <- DCT2D(g) %>% IDCT2D() %>% plot(main = "Transformed")
mean((g - gg)^2)



