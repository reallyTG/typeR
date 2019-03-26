library(imagerExtra)


### Name: EqualizeDP
### Title: Double Plateaus Histogram Equalization
### Aliases: EqualizeDP

### ** Examples

g <- grayscale(dogs)
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
EqualizeDP(g, 20, 186) %>% plot(main = "Contrast Enhanced")



