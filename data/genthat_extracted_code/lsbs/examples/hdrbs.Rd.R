library(lsbs)


### Name: hdrbs
### Title: Calculate the optiaml bandwidth matrix for highest density
###   region estimation
### Aliases: hdrbs

### ** Examples

X <- matrix(rnorm(100),ncol=2)
xrange <- c(-2.5,2.5)
yrange <- c(-2.5,2.5)
hdrbs(X,0.1,xrange,yrange,0.1)




