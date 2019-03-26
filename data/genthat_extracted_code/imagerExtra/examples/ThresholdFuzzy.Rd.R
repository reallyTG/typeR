library(imagerExtra)


### Name: ThresholdFuzzy
### Title: Fuzzy Entropy Image Segmentation
### Aliases: ThresholdFuzzy

### ** Examples

g <- grayscale(boats)
layout(matrix(1:2, 1, 2))
plot(g, main = "Original")
ThresholdFuzzy(g) %>% plot(main = "Fuzzy Thresholding")



