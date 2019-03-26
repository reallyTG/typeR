library(VCA)


### Name: Csweep
### Title: Calling C-implementation of the SWEEP-Operator
### Aliases: Csweep

### ** Examples

## Not run: 
##D # use example from 'lm' Rdoc
##D ctl    <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
##D trt    <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
##D group  <- gl(2, 10, 20, labels = c("Ctl","Trt"))
##D weight <- c(ctl, trt)
##D lm.D9  <- lm(weight ~ group)
##D anova(lm.D9)
##D 
##D # create augmented matrix
##D X  <- model.matrix(lm.D9)
##D Xt <- t(X)
##D y  <- matrix(weight, ncol=1)
##D yt <- t(y)
##D M  <- rbind(	cbind(as.matrix(Xt%*%X), as.matrix(Xt%*%y)), 
##D 		        cbind(as.matrix(yt%*%X), as.matrix(yt%*%y)))
##D swept <- VCA:::Csweep(M, asgn=c(0,1))					
##D LC    <- swept$LC
##D SS    <- swept$SSQ
##D SSQ   <- abs(diff(SS))
##D SSQ   <- c(SSQ, tail(SS,1))
##D SSQ		# compare to column "Sum Sq" in 'anova(lmD9)' output
## End(Not run)



