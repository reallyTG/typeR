library(kohonen)


### Name: peppaPic
### Title: Synthetic image of a pepper plant with peppers
### Aliases: peppaPic
### Keywords: datasets

### ** Examples

data(peppaPic)
head(peppaPic)
## show ground truth per pixel
image(t(matrix(peppaPic[,1], 600, 800))[,600:1], col = rainbow(10))



