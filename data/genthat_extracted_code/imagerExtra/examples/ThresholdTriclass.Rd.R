library(imagerExtra)


### Name: ThresholdTriclass
### Title: Iterative Triclass Thresholding
### Aliases: ThresholdTriclass

### ** Examples

g <- grayscale(boats)
layout(matrix(1:4, 2, 2))
plot(boats, main = "Original")
plot(g, main = "Grayscale")
threshold(g) %>% plot(main = "A Variant of Otsu")
ThresholdTriclass(g) %>% plot(main = "Triclass")



