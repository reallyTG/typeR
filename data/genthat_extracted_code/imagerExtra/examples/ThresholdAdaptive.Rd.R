library(imagerExtra)


### Name: ThresholdAdaptive
### Title: Local Adaptive Thresholding
### Aliases: ThresholdAdaptive

### ** Examples

layout(matrix(1:4, 2, 2))
plot(papers, main = "Original")
threshold(papers) %>% plot(main = "A variant of Otsu")
ThresholdAdaptive(papers, 0, range = c(0,1)) %>% plot(main = "local adaptive (k = 0)")
ThresholdAdaptive(papers, 0.2, range = c(0,1)) %>% plot(main = "local adaptive (k = 0.2)")



