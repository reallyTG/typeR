library(MXM)


### Name: Generalised orthogonal matching pursuit (gOMP)
### Title: Generalised orthogonal matching pursuit (gOMP)
### Aliases: gomp gomp.path boot.gomp

### ** Examples

x <- matrix( rnorm(100 * 100), ncol = 100)
y <- rnorm(100)
b <- MXM::gomp(y, x, test = "testIndFisher")



