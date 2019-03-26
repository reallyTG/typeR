library(cbsem)


### Name: gscals
### Title: Estimating GSC models belonging to scenarios
###   reflective-reflective, formative-reflective and formative-formative
### Aliases: gscals

### ** Examples

data(mobi250)
ind <- c(1, 1, 1, 4, 4, 4, 2, 2, 2, 3, 3, 5, 5, 5, 6, 6, 6, 7, 1, 1, 4, 4, 4, 4) 
o <- order(ind)
indicatorx <- c(1,1,1,1,1)
indicatory <- c(1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5)   
dat <- mobi250[,o]
dat <- dat[,-ncol(dat)]
B <- matrix(c(0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,
              0,1,1,0,0,0,0,1,1,1,0,0,1,0,0,0,1,0),6,6,byrow=TRUE)
out <- gscals(dat,B,indicatorx,indicatory,loadingx=TRUE,loadingy=TRUE,maxiter=200,biascor=FALSE)




