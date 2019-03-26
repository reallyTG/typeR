library(FDboost)


### Name: truncateTime
### Title: Function to truncate time in functional data
### Aliases: truncateTime

### ** Examples

if(require(fda)){
  dat <- fda::growth
  dat$hgtm <- t(dat$hgtm[,1:10])
  dat$hgtf <- t(dat$hgtf[,1:10])
  
  ## only use time-points 1:16 of variable age
  datTr <- truncateTime(funVar=c("hgtm","hgtf"), time="age", newtime=1:16, data=dat)
  
  ## Not run: 
##D   par(mfrow=c(1,2))
##D   with(dat, funplot(age, hgtm, main="Original data"))
##D   with(datTr, funplot(age, hgtm, main="Yearly data"))
##D   par(mfrow=c(1,1))   
##D   
## End(Not run)
}



