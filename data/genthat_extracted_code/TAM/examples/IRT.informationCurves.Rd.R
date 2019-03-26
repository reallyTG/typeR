library(TAM)


### Name: IRT.informationCurves
### Title: Item and Test Information Curve
### Aliases: IRT.informationCurves IRT.informationCurves.tam.mml
###   IRT.informationCurves.tam.mml.2pl IRT.informationCurves.tam.mml.3pl
###   IRT.informationCurves.tam.mml.mfr plot.IRT.informationCurves
### Keywords: Information curves

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dichotomous data | data.read
##D #############################################################################
##D 
##D data(data.read, package="sirt")
##D dat <- data.read
##D 
##D # fit 2PL model
##D mod1 <- TAM::tam.mml.2pl( dat )
##D summary(mod1)
##D 
##D # compute information curves at grid seq(-5,5,length=100)
##D imod1 <- TAM::IRT.informationCurves( mod1, theta=seq(-5,5,len=100)  )
##D str(imod1)
##D # plot test information
##D plot( imod1 )
##D # plot standard error curve
##D plot( imod1, curve_type="se", xlim=c(-3,2) )
##D # cutomized plot
##D plot( imod1, curve_type="se", xlim=c(-3,2), ylim=c(0,2), lwd=2, lty=3)
##D 
##D #############################################################################
##D # EXAMPLE 2: Mixed dichotomous and polytomous data
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored, package="TAM")
##D dat <- data.timssAusTwn.scored
##D # select item response data
##D items <- grep( "M0", colnames(dat), value=TRUE )
##D resp <- dat[, items ]
##D 
##D #*** Model 1: Partial credit model
##D mod1 <- TAM::tam.mml( resp )
##D summary(mod1)
##D # information curves
##D imod1 <- TAM::IRT.informationCurves( mod1, theta=seq(-3,3,len=20)  )
##D 
##D #*** Model 2: Generalized partial credit model
##D mod2 <- TAM::tam.mml.2pl( resp, irtmodel="GPCM")
##D summary(mod2)
##D imod2 <- TAM::IRT.informationCurves( mod2 )
##D 
##D #*** Model 3: Mixed 3PL and generalized partial credit model
##D psych::describe(resp)
##D maxK <- apply( resp, 2, max, na.rm=TRUE )
##D I <- ncol(resp)
##D # specify guessing parameters, including a prior distribution
##D est.guess <- 1:I
##D est.guess[ maxK > 1 ] <- 0
##D guess <- .2*(est.guess >0)
##D guess.prior <- matrix( 0, nrow=I, ncol=2 )
##D guess.prior[ est.guess  > 0, 1] <- 5
##D guess.prior[ est.guess  > 0, 2] <- 17
##D 
##D # fit model
##D mod3 <- TAM::tam.mml.3pl( resp, gammaslope.des="2PL", est.guess=est.guess, guess=guess,
##D            guess.prior=guess.prior,
##D            control=list( maxiter=100, Msteps=10, fac.oldxsi=0.1,
##D                         nodes=seq(-8,8,len=41) ),  est.variance=FALSE )
##D summary(mod3)
##D 
##D # information curves
##D imod3 <- TAM::IRT.informationCurves( mod3 )
##D imod3
##D 
##D #*** estimate model in mirt package
##D library(mirt)
##D itemtype <- rep("gpcm", I)
##D itemtype[ maxK==1] <- "3PL"
##D mod3b <- mirt::mirt(resp, 1, itemtype=itemtype, verbose=TRUE )
##D print(mod3b)
## End(Not run)



