library(rdetools)


### Name: distimage
### Title: Distance image
### Aliases: distimage
### Keywords: hplot models classif regression

### ** Examples

## model selection with RBF-kernel and graphical illustration
## of the distances of the labels
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, ydist = TRUE, sigma = logspace(-3, 3, 100))
distimage(m) # distance image



