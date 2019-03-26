library(imagerExtra)


### Name: EqualizeADP
### Title: Adaptive Double Plateaus Histogram Equalization
### Aliases: EqualizeADP

### ** Examples

g <- grayscale(dogs)
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
EqualizeADP(g) %>% plot(main = "Contrast Enhanced")



