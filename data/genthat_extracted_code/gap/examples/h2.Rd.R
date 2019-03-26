library(gap)


### Name: h2
### Title: Heritability estimation according to twin correlations
### Aliases: h2
### Keywords: htest

### ** Examples

## Not run: 
##D 
##D ACE_CI <- function(mzData,dzData,n.sim=5,selV=NULL,verbose=TRUE)
##D {
##D ACEr_twinData <- h2(mzDat=mzData,dzDat=dzData,selV=selV)
##D print(ACEr_twinData)
##D 
##D nmz <- dim(mzData)[1]
##D ndz <- dim(dzData)[1]
##D a <- ar <- vector()
##D set.seed(12345)
##D for(i in 1:n.sim)
##D {
##D   cat("\rRunning # ",i,"/", n.sim,"\r",sep="")
##D   sampled_mz <- sample(1:nmz, replace=TRUE)
##D   sampled_dz <- sample(1:ndz, replace=TRUE)
##D   mzDat <- mzData[sampled_mz,]
##D   dzDat <- dzData[sampled_dz,]
##D   ACEr_i <- h2(mzDat=mzDat,dzDat=dzDat,selV=selV)
##D   if(verbose) print(ACEr_i)
##D   ar <- rbind(ar,ACEr_i)
##D }
##D cat("\n\nheritability according to correlations\n\n")
##D ar <- as.data.frame(ar)
##D m <- mean(ar,na.rm=TRUE)
##D s <- sd(ar,na.rm=TRUE)
##D allr <- data.frame(mean=m,sd=s,lcl=m-1.96*s,ucl=m+1.96*s)
##D print(allr)
##D }
##D 
##D selVars <- c('bmi1','bmi2')
##D 
##D library(mvtnorm)
##D n.sim <- 500
##D cat ("\nThe first study\n\n")
##D mzm <- as.data.frame(rmvnorm(195, c(22.75,22.75),
##D                      matrix(2.66^2*c(1, 0.67, 0.67, 1), 2)))
##D dzm <- as.data.frame(rmvnorm(130, c(23.44,23.44),
##D                      matrix(2.75^2*c(1, 0.32, 0.32, 1), 2)))
##D mzw <- as.data.frame(rmvnorm(384, c(21.44,21.44),
##D                      matrix(3.08^2*c(1, 0.72, 0.72, 1), 2)))
##D dzw <- as.data.frame(rmvnorm(243, c(21.72,21.72),
##D                      matrix(3.12^2*c(1, 0.33, 0.33, 1), 2)))
##D names(mzm) <- names(dzm) <- names(mzw) <- names(dzw) <- c("bmi1","bmi2")
##D ACE_CI(mzm,dzm,n.sim,selV=selVars,verbose=FALSE)
##D ACE_CI(mzw,dzw,n.sim,selV=selVars,verbose=FALSE)
##D 
## End(Not run)



