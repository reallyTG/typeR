library(cbsem)


### Name: boottestgscm
### Title: Testing two segmentations of a GSC model
### Aliases: boottestgscm

### ** Examples

## No test: 
 
  data(twoclm)
  member1 <- c(rep(1,50),rep(2,50))
  member2 <- twoclm[,10]
  dat <- twoclm[,-10]
  B <- matrix(c( 0,0,0, 0,0,0, 1,1,0),3,3,byrow=TRUE)
  indicatorx <- c(1,1,1,2,2,2)
  indicatory <- c(1,1,1)   
  boottestgscm(dat,B,indicatorx,indicatory,loadingx=FALSE,loadingy=FALSE,
               member2,member1,0.1,inner=FALSE)
## End(No test)



