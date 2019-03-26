library(rdetools)


### Name: drawkpc
### Title: Draw kernel pca coefficients
### Aliases: drawkpc
### Keywords: hplot models classif regression

### ** Examples

## draw kernel pca coefficients after calling rde
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X)
r <- rde(K, d$y, est_noise = TRUE)
drawkpc(r)

## draw kernel pca coefficients after calling selectmodel
d <- sincdata(100, 0.1) # generate sinc data
m <- selectmodel(d$X, d$y, est_noise = TRUE, sigma = logspace(-3, 3, 100))
drawkpc(m)



