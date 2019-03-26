library(STAR)


### Name: rexpMLE
### Title: Maximum Likelihood Parameter Estimation of a Refractory
###   Exponential Model with Possibly Censored Data
### Aliases: rexpMLE
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## Simulate sample of size 100 from a refractory exponential distribution
##D set.seed(1102006,"Mersenne-Twister")
##D sampleSize <- 100
##D rate.true <- 20
##D rp.true <- 0.01
##D sampRE <- rrexp(sampleSize,rate=rate.true,rp=rp.true)
##D sampREmleRE <- rexpMLE(sampRE)
##D rbind(est = sampREmleRE$estimate,se = sampREmleRE$se,true = c(rate.true,rp.true))
##D 
##D ## make a parametric boostrap to check the distribution of the deviance
##D nbReplicate <- 10000
##D system.time(
##D             devianceRE100 <- replicate(nbReplicate,{
##D               sampRE <- rrexp(sampleSize,rate=rate.true,rp=rp.true)
##D               sampREmleRE <- rexpMLE(sampRE)
##D               -2*sampREmleRE$r(rate.true,rp.true)
##D             }
##D                                        )
##D             )[3]
##D 
##D ## Get 95 and 99% confidence intervals for the QQ plot
##D ci <- sapply(1:nbReplicate,
##D                  function(idx) qchisq(qbeta(c(0.005,0.025,0.975,0.995),
##D                                             idx,
##D                                             nbReplicate-idx+1),
##D                                       df=2)
##D              )
##D ## make QQ plot
##D X <- qchisq(ppoints(nbReplicate),df=2)
##D Y <- sort(devianceRE100)
##D X11()
##D plot(X,Y,type="n",
##D      xlab=expression(paste(chi[2]^2," quantiles")),
##D      ylab="MC quantiles",
##D      main="Deviance with true parameters after ML fit of refractory Poisson data",
##D      sub=paste("sample size:", sampleSize,"MC replicates:", nbReplicate)
##D      )
##D abline(a=0,b=1)
##D lines(X,ci[1,],lty=2)
##D lines(X,ci[2,],lty=2)
##D lines(X,ci[3,],lty=2)
##D lines(X,ci[4,],lty=2)
##D lines(X,Y,col=2)
## End(Not run)



