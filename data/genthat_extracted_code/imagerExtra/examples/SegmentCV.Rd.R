library(imagerExtra)


### Name: SegmentCV
### Title: Chan-Vese segmentation
### Aliases: SegmentCV

### ** Examples

layout(matrix(1:2, 1, 2))
g <- grayscale(dogs)
plot(g, main = "Original")
SegmentCV(g, lambda2 = 15) %>% plot(main = "Binarized")



