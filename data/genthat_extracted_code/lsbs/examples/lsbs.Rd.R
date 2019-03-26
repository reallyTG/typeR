library(lsbs)


### Name: lsbs
### Title: Calculate the optiaml bandwidth matrix for level set estimation
### Aliases: lsbs

### ** Examples

X <- matrix(rnorm(100),ncol=2)
xrange <- c(-3,3)
yrange <- c(-3,3)
lsbs(X,0.1,xrange,yrange,0.05)



