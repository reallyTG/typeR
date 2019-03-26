library(rdetools)


### Name: modelimage
### Title: Model selection image
### Aliases: modelimage
### Keywords: hplot models classif regression

### ** Examples

## model selection with RBF-kernel and graphical illustration
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
modelimage(m) # draw model selection image



