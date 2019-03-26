library(sirt)


### Name: truescore.irt
### Title: Conversion of Trait Scores theta into True Scores tau ( theta )
### Aliases: truescore.irt
### Keywords: True scores

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset with mixed dichotomous and polytomous responses
#############################################################################

data(data.mixed1)
dat <- data.mixed1

#****
# Model 1: Partial credit model
# estimate model with TAM package
library(TAM)
mod1 <- TAM::tam.mml( dat )
# estimate person parameter estimates
wmod1 <- TAM::tam.wle( mod1 )
wmod1 <- wmod1[ order(wmod1$theta), ]
# extract item parameters
A <- mod1$B[,-1,1]
B <- mod1$AXsi[,-1]
# person parameters and standard errors
theta <- wmod1$theta
error <- wmod1$error

# estimate true score transformation
dfr <- sirt::truescore.irt( A=A, B=B, theta=theta, error=error )

# plot different person parameter estimates and standard errors
par(mfrow=c(2,2))
plot( theta, dfr$truescore, pch=16, cex=.6, xlab=expression(theta), type="l",
    ylab=expression(paste( tau, "(",theta, ")" )), main="True Score Transformation" )
plot( theta, dfr$percscore, pch=16, cex=.6, xlab=expression(theta), type="l",
    ylab=expression(paste( pi, "(",theta, ")" )), main="Percent Score Transformation" )
points( theta, dfr$lower + (dfr$upper-dfr$lower)*
                stats::plogis(dfr$a*theta+dfr$b), col=2, lty=2)
plot( theta, error, pch=16, cex=.6, xlab=expression(theta), type="l",
    ylab=expression(paste("SE(",theta, ")" )), main="Standard Error Theta" )
plot( dfr$truescore, dfr$truescore.error, pch=16, cex=.6, xlab=expression(tau),
    ylab=expression(paste("SE(",tau, ")" ) ), main="Standard Error True Score Tau",
    type="l")
par(mfrow=c(1,1))

## Not run: 
##D #****
##D # Model 2: Generalized partial credit model
##D mod2 <- TAM::tam.mml.2pl( dat, irtmodel="GPCM")
##D # estimate person parameter estimates
##D wmod2 <- TAM::tam.wle( mod2 )
##D # extract item parameters
##D A <- mod2$B[,-1,1]
##D B <- mod2$AXsi[,-1]
##D # person parameters and standard errors
##D theta <- wmod2$theta
##D error <- wmod2$error
##D # estimate true score transformation
##D dfr <- sirt::truescore.irt( A=A, B=B, theta=theta, error=error )
##D 
##D #############################################################################
##D # EXAMPLE 2: Dataset Reading data.read
##D #############################################################################
##D data(data.read)
##D 
##D #****
##D # Model 1: estimate difficulty + guessing model
##D mod1 <- sirt::rasch.mml2( data.read, fixed.c=rep(.25,12) )
##D mod1$person <- mod1$person[ order( mod1$person$EAP), ]
##D # person parameters and standard errors
##D theta <- mod1$person$EAP
##D error <- mod1$person$SE.EAP
##D A <- rep(1,12)
##D B <- - mod1$item$b
##D c <- rep(.25,12)
##D # estimate true score transformation
##D dfr <- sirt::truescore.irt( A=A, B=B, theta=theta, error=error,c=c)
##D 
##D plot( theta, dfr$percscore, pch=16, cex=.6, xlab=expression(theta), type="l",
##D     ylab=expression(paste( pi, "(",theta, ")" )), main="Percent Score Transformation" )
##D points( theta, dfr$lower + (dfr$upper-dfr$lower)*
##D              stats::plogis(dfr$a*theta+dfr$b), col=2, lty=2)
##D 
##D #****
##D # Model 2: Rasch model
##D mod2 <- sirt::rasch.mml2( data.read  )
##D # person parameters and standard errors
##D theta <- mod2$person$EAP
##D error <- mod2$person$SE.EAP
##D A <- rep(1,12)
##D B <- - mod2$item$b
##D # estimate true score transformation
##D dfr <- sirt::truescore.irt( A=A, B=B, theta=theta, error=error )
## End(Not run)



