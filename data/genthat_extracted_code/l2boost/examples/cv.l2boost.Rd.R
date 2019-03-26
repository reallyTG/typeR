library(l2boost)


### Name: cv.l2boost
### Title: K-fold cross-validation using 'l2boost'.
### Aliases: cv.l2boost

### ** Examples

## Not run: 
##D #--------------------------------------------------------------------------
##D # Example: ElasticBoost simulation
##D # Compare l2boost and elasticNetBoosting using 10-fold CV
##D # 
##D # Elastic net simulation, see Zou H. and Hastie T. Regularization and 
##D # variable selection via the elastic net. J. Royal Statist. Soc. B, 
##D # 67(2):301-320, 2005
##D set.seed(1025)
##D dta <- elasticNetSim(n=100)
##D 
##D # The default values set up the signal on 3 groups of 5 variables,
##D # Color the signal variables red, others are grey.
##D sig <- c(rep("red", 15), rep("grey", 40-15))
##D 
##D # Set the boosting parameters
##D Mtarget = 1000
##D nuTarget = 1.e-2
##D 
##D # For CRAN, only use 2 cores in the CV method
##D cvCores=2
##D 
##D # 10 fold l2boost CV  
##D cv.obj <- cv.l2boost(dta$x,dta$y,M=Mtarget, nu=nuTarget, cores=cvCores)
##D 
##D # Plot the results
##D par(mfrow=c(2,3))
##D plot(cv.obj)
##D abline(v=cv.obj$opt.step, lty=2, col="grey")
##D plot(cv.obj$fit, type="coef", ylab=expression(beta[i]))
##D abline(v=cv.obj$opt.step, lty=2, col="grey")
##D plot(coef(cv.obj$fit, m=cv.obj$opt.step), cex=.5, 
##D   ylab=expression(beta[i]), xlab="Column Index", ylim=c(0,140), col=sig)
##D 
##D # elasticBoost l1-regularization parameter lambda=0.1 
##D # 5 fold elasticNet CV
##D cv.eBoost <- cv.l2boost(dta$x,dta$y,M=Mtarget, K=5, nu=nuTarget, lambda=.1, cores=cvCores) 
##D 
##D # plot the results
##D plot(cv.eBoost)
##D abline(v=cv.eBoost$opt.step, lty=2, col="grey")
##D plot(cv.eBoost$fit, type="coef", ylab=expression(beta[i]))
##D abline(v=cv.eBoost$opt.step, lty=2, col="grey")
##D plot(coef(cv.eBoost$fit, m=cv.obj$opt.step), cex=.5, 
##D   ylab=expression(beta[i]), xlab="Column Index", ylim=c(0,140), col=sig)
## End(Not run)




