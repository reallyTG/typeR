library(STAR)


### Name: weibullMLE
### Title: Maximum Likelihood Parameter Estimation of a Weibull Model with
###   Possibly Censored Data
### Aliases: weibullMLE
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## Simulate sample of size 100 from a weibull distribution
##D set.seed(1102006,"Mersenne-Twister")
##D sampleSize <- 100
##D shape.true <- 2.5
##D scale.true <- 0.085
##D sampWB <- rweibull(sampleSize,shape=shape.true,scale=scale.true)
##D sampWBmleWB <- weibullMLE(sampWB)
##D rbind(est = sampWBmleWB$estimate,se = sampWBmleWB$se,true = c(shape.true,scale.true))
##D 
##D ## Estimate the log relative likelihood on a grid to plot contours
##D Shape <- seq(sampWBmleWB$estimate[1]-4*sampWBmleWB$se[1],
##D                sampWBmleWB$estimate[1]+4*sampWBmleWB$se[1],
##D                sampWBmleWB$se[1]/10)
##D Scale <- seq(sampWBmleWB$estimate[2]-4*sampWBmleWB$se[2],
##D              sampWBmleWB$estimate[2]+4*sampWBmleWB$se[2],
##D              sampWBmleWB$se[2]/10)
##D sampWBmleWBcontour <- sapply(Shape, function(sh) sapply(Scale, function(sc) sampWBmleWB$r(sh,sc)))
##D ## plot contours using a linear scale for the parameters
##D ## draw four contours corresponding to the following likelihood ratios:
##D ##  0.5, 0.1, Chi2 with 2 df and p values of 0.95 and 0.99
##D X11(width=12,height=6)
##D layout(matrix(1:2,ncol=2))
##D contour(Shape,Scale,t(sampWBmleWBcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab="shape",ylab="scale",
##D         main="Log Relative Likelihood Contours"
##D         )
##D points(sampWBmleWB$estimate[1],sampWBmleWB$estimate[2],pch=3)
##D points(shape.true,scale.true,pch=16,col=2)
##D ## The contours are not really symmetrical about the MLE we can try to
##D ## replot them using a log scale for the parameters to see if that improves
##D ## the situation
##D contour(log(Shape),log(Scale),t(sampWBmleWBcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels="",
##D         xlab="log(shape)",ylab="log(scale)",
##D         main="Log Relative Likelihood Contours",
##D         sub="log scale for the parameters")
##D points(log(sampWBmleWB$estimate[1]),log(sampWBmleWB$estimate[2]),pch=3)
##D points(log(shape.true),log(scale.true),pch=16,col=2)
##D 
##D ## make a parametric boostrap to check the distribution of the deviance
##D nbReplicate <- 10000
##D sampleSize <- 100
##D system.time(
##D             devianceWB100 <- replicate(nbReplicate,{
##D               sampWB <- rweibull(sampleSize,shape=shape.true,scale=scale.true)
##D               sampWBmleWB <- weibullMLE(sampWB)
##D               -2*sampWBmleWB$r(shape.true,scale.true)
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
##D Y <- sort(devianceWB100)
##D X11()
##D plot(X,Y,type="n",
##D      xlab=expression(paste(chi[2]^2," quantiles")),
##D      ylab="MC quantiles",
##D      main="Deviance with true parameters after ML fit of gamma data",
##D      sub=paste("sample size:", sampleSize,"MC replicates:", nbReplicate)
##D      )
##D abline(a=0,b=1)
##D lines(X,ci[1,],lty=2)
##D lines(X,ci[2,],lty=2)
##D lines(X,ci[3,],lty=2)
##D lines(X,ci[4,],lty=2)
##D lines(X,Y,col=2)
## End(Not run)



