library(DoseFinding)


### Name: glycobrom
### Title: Glycopyrronium Bromide dose-response data
### Aliases: glycobrom
### Keywords: datasets

### ** Examples

 ## simulate a full data set with given means and sdv (here we ignore
  ## the original study was a cross-over design, and simulate a parallel
  ## group design)
  simData <- function(mn, sd, n, doses, fixed = TRUE){
    ## simulate data with means (mns) and standard deviations (sd), for
    ## fixed = TRUE, the data set will have observed means and standard
    ## deviations as given in mns and sd
    resp <- numeric(sum(n))
    uppind <- cumsum(n)
    lowind <- c(0,uppind)+1
    for(i in 1:length(n)){
      rv <- rnorm(n[i])
      if(fixed)
        rv <- scale(rv)
      resp[lowind[i]:uppind[i]] <- mn[i] + sd[i]*rv
    }
    data.frame(doses=rep(doses, n), resp=resp)
  }
  data(glycobrom)
  fullDat <- simData(glycobrom$fev1, glycobrom$sdev, glycobrom$n,
                     glycobrom$dose)



