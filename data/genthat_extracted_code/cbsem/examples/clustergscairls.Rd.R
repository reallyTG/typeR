library(cbsem)


### Name: clustergscairls
### Title: Clustering gsc-models
### Aliases: clustergscairls

### ** Examples

## No test: 
 
data(twoclm)
dat <- twoclm[,-10]
B <- matrix(c( 0,0,0, 0,0,0, 1,1,0),3,3,byrow=TRUE)
indicatorx <- c(1,1,1,2,2,2)
indicatory <- c(1,1,1)  
out <- clustergscairls(dat,B,indicatorx,indicatory,loadingx=FALSE,loadingy=FALSE,2,minmem=6,1) 
## End(No test)



