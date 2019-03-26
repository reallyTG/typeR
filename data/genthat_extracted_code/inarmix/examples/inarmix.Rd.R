library(inarmix)


### Name: inarmix
### Title: Finite mixture model for longitudinal count data.
### Aliases: inarmix
### Keywords: models regression

### ** Examples

set.seed(4297)

############################################################
#### Simulate data from a two class model

XX <- cbind(rep(1,9),c(0:8)/4)
colnames(XX) <- c("const","time")
beta <- rbind(c(-.2,0),c(1.2,.3))
### this means that for group 1: (beta_{0},beta_{1}) = (-.2,0)
### and for group 2: (beta_{0},beta_{1}) = (1.2,.3)
autocorr <- c(.2,.2)
scale <- c(2,2)
mix.prop <- c(.8,.2)  ## proportion in group 1 is .8

testdat <- GenerateMixData(500,beta,autocorr,scale,mix.prop,XX)
testdat[1:5,]


########################################################################
####  Fit a linear curve with two classes (with a maximum of 4 iterations)

twoclassfit <- inarmix(y~time,nclasses=2,id=subject,data=testdat,maxiter=4)
summary(twoclassfit)

diagnose(twoclassfit)

#############################################################
#####  Fit the same model with specified starting values.

inpars <- list()
inpars$coef <- rbind(c(-.5,.1),c(.5,0))
inpars$autocorr <- rep(.3,2)
inpars$scale <- rep(2,2)
inpars$mix.prop <- c(.6,.4)

twoclassfit2 <- inarmix(y~time,nclasses=2,id=subject,data=testdat,initvals=inpars,
                        maxiter=4)
summary(twoclassfit2)


###############################################################
### Try fitting a one class model with the same data
oneclassfit <- inarmix(y~time,nclasses=1,id=subject,data=testdat)
summary(oneclassfit)


#########################################################################
####  Fit a two class model with multiple starts
## Not run: 
##D testfit_multi <- inarmix(y~time,nclasses=2,id=subject,data=testdat,num.restarts=3)
##D summary(testfit_multi)
##D 
##D #### Look at final log-likelihood values for each restart
##D testfit_multi$reploglik
##D 
##D #### Look at final parameter estimates for each restart
##D testfit_multi$finalvals
##D 
##D #############################################################################
##D ###########  Simulate data from a four class model
##D 
##D XX <- cbind(rep(1,9),seq(0,2,by=.25))
##D colnames(XX) <- c("const","time")
##D beta <- rbind(c(-.4,-.1),c(1.4,-.6),c(0,.7),c(1.4,0))
##D autocorr <- rep(.2,4)
##D scale <- rep(1.5,4)
##D mix.prop <- c(.5,.25,.15,.1)
##D 
##D testdat4 <- GenerateMixData(1000,beta,autocorr,scale,mix.prop,XX)
##D 
##D ### Fit a four class model
##D 
##D testfit_four <- inarmix(y~time,nclasses=4,id=subject,data=testdat4,maxiter=5)
##D summary(testfit_four)
## End(Not run)




