library(MAVE)


### Name: coef.mave
### Title: Directions of CS or CMS of given dimension
### Aliases: coef.mave coef.mave.dim

### ** Examples

x <- matrix(rnorm(400),100,4)
y <- x[,1]+x[,2]+as.matrix(rnorm(100))
dr <- mave(y~x)
dir3 <- coef(dr,3)

dr.dim <- mave.dim(dr)
dir3 <- coef(dr.dim,3)
dir.best <- coef(dr.dim)




