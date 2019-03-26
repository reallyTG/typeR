library(STAR)


### Name: llogisMLE
### Title: Maximum Likelihood Parameter Estimation of a Log Logistic Model
###   with Possibly Censored Data
### Aliases: llogisMLE
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## Simulate sample of size 100 from a log logisitic
##D ## distribution
##D set.seed(1102006,"Mersenne-Twister")
##D sampleSize <- 100
##D location.true <- -2.7
##D scale.true <- 0.025
##D sampLL <- rllogis(sampleSize,location=location.true,scale=scale.true)
##D sampLLmleLL <- llogisMLE(sampLL)
##D rbind(est = sampLLmleLL$estimate,se = sampLLmleLL$se,true = c(location.true,scale.true))
##D 
##D ## Estimate the log relative likelihood on a grid to plot contours
##D Loc <- seq(sampLLmleLL$estimate[1]-4*sampLLmleLL$se[1],
##D                sampLLmleLL$estimate[1]+4*sampLLmleLL$se[1],
##D                sampLLmleLL$se[1]/10)
##D Scale <- seq(sampLLmleLL$estimate[2]-4*sampLLmleLL$se[2],
##D              sampLLmleLL$estimate[2]+4*sampLLmleLL$se[2],
##D              sampLLmleLL$se[2]/10)
##D sampLLmleLLcontour <- sapply(Loc, function(m) sapply(Scale, function(s) sampLLmleLL$r(m,s)))
##D ## plot contours using a linear scale for the parameters
##D ## draw four contours corresponding to the following likelihood ratios:
##D ##  0.5, 0.1, Chi2 with 2 df and p values of 0.95 and 0.99
##D X11(width=12,height=6)
##D layout(matrix(1:2,ncol=2))
##D contour(Loc,Scale,t(sampLLmleLLcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels=c("log(0.5)",
##D           "log(0.1)",
##D           "-1/2*P(Chi2=0.95)",
##D           "-1/2*P(Chi2=0.99)"),
##D         xlab="Location",ylab="Scale",
##D         main="Log Relative Likelihood Contours"
##D         )
##D points(sampLLmleLL$estimate[1],sampLLmleLL$estimate[2],pch=3)
##D points(location.true,scale.true,pch=16,col=2)
##D ## The contours are not really symmetrical about the MLE we can try to
##D ## replot them using a log scale for the parameters to see if that improves
##D ## the situation
##D contour(Loc,log(Scale),t(sampLLmleLLcontour),
##D         levels=c(log(c(0.5,0.1)),-0.5*qchisq(c(0.95,0.99),df=2)),
##D         labels="",
##D         xlab="log(Location)",ylab="log(Scale)",
##D         main="Log Relative Likelihood Contours",
##D         sub="log scale for parameter: scale")
##D points(sampLLmleLL$estimate[1],log(sampLLmleLL$estimate[2]),pch=3)
##D points(location.true,log(scale.true),pch=16,col=2)
##D 
##D ## make a parametric boostrap to check the distribution of the deviance
##D nbReplicate <- 10000
##D sampleSize <- 100
##D system.time(
##D             devianceLL100 <- replicate(nbReplicate,{
##D               sampLL <- rllogis(sampleSize,location=location.true,scale=scale.true)
##D               sampLLmleLL <- llogisMLE(sampLL)
##D               -2*sampLLmleLL$r(location.true,scale.true)
##D             }
##D                                        )
##D             )[3]
##D 
##D ## Get 95 and 99##D 
##D ci <- sapply(1:nbReplicate,
##D                  function(idx) qchisq(qbeta(c(0.005,0.025,0.975,0.995),
##D                                             idx,
##D                                             nbReplicate-idx+1),
##D                                       df=2)
##D              )
##D ## make QQ plot
##D X <- qchisq(ppoints(nbReplicate),df=2)
##D Y <- sort(devianceLL100)
##D X11()
##D plot(X,Y,type="n",
##D      xlab=expression(paste(chi[2]^2," quantiles")),
##D      ylab="MC quantiles",
##D      main="Deviance with true parameters after ML fit of log logistic data",
##D      sub=paste("sample size:", sampleSize,"MC replicates:", nbReplicate)
##D      )
##D abline(a=0,b=1)
##D lines(X,ci[1,],lty=2)
##D lines(X,ci[2,],lty=2)
##D lines(X,ci[3,],lty=2)
##D lines(X,ci[4,],lty=2)
##D lines(X,Y,col=2)
## End(Not run)



