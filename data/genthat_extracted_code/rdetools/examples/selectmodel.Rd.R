library(rdetools)


### Name: selectmodel
### Title: Model selection
### Aliases: selectmodel
### Keywords: models classif regression

### ** Examples

## model selection with RBF-kernel
d <- sincdata(100, 0.1) # generate sinc data
# do model selection, calculate also denoised labels
m <- selectmodel(d$X, d$y, est_y = TRUE, sigma = logspace(-3, 3, 100))
m$best # best model
m$rd # relevant dimension for best model
modelimage(m) # draw model selection image

## model selection with polynomial kernel
d <- sincdata(100, 0.1) # generate sinc data
# do model selection, calculate also denoised labels
m <- selectmodel(d$X, d$y, kernel = polykernel, est_y = TRUE, d = 1:20)
m$best # best model
m$rd # relevant dimension for best model
modelimage(m, log = FALSE) # draw model selection image



