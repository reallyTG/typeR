library(TAM)


### Name: tam.jml
### Title: Joint Maximum Likelihood Estimation
### Aliases: tam.jml summary.tam.jml logLik.tam.jml
### Keywords: Joint maximum likelihood estimation (JML) summary

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data
#############################################################################
data(data.sim.rasch)
resp <- data.sim.rasch[1:700, seq( 1, 40, len=10)  ]  # subsample
# estimate the Rasch model with JML (function 'tam.jml')
mod1a <- TAM::tam.jml(resp=resp)
summary(mod1a)
itemfit <- TAM::tam.fit(mod1a)$fit.item

# compare results with Rasch model estimated by MML
mod1b <- TAM::tam.mml(resp=resp )

# plot estimated parameters
plot( mod1a$xsi, mod1b$xsi$xsi, pch=16,
    xlab=expression( paste( xi[i], " (JML)" )),
    ylab=expression( paste( xi[i], " (MML)" )),
    main="Item Parameter Estimate Comparison")
lines( c(-5,5), c(-5,5), col="gray" )

# Now, the adjustment pf .05 instead of the default .3 is used.
mod1d <- TAM::tam.jml(resp=resp, adj=.05)
# compare item parameters
round( rbind( mod1a$xsi, mod1d$xsi ), 3 )
  ##          [,1]   [,2]   [,3]   [,4]   [,5]  [,6]  [,7]  [,8]  [,9] [,10]
  ##   [1,] -2.076 -1.743 -1.217 -0.733 -0.338 0.147 0.593 1.158 1.570 2.091
  ##   [2,] -2.105 -1.766 -1.233 -0.746 -0.349 0.139 0.587 1.156 1.574 2.108

# person parameters for persons with a score 0, 5 and 10
pers1 <- data.frame( "score_adj0.3"=mod1a$PersonScore, "theta_adj0.3"=mod1a$theta,
           "score_adj0.05"=mod1d$PersonScore, "theta_adj0.05"=mod1d$theta  )
round( pers1[ c(698, 683, 608), ],3  )
  ##       score_adj0.3 theta_adj0.3 score_adj0.05 theta_adj0.05
  ##   698          0.3       -4.404          0.05        -6.283
  ##   683          5.0       -0.070          5.00        -0.081
  ##   608          9.7        4.315          9.95         6.179

## Not run: 
##D #*** item fit and person fit statistics
##D fmod1a <- TAM::tam.jml.fit(mod1a)
##D head(fmod1a$fit.item)
##D head(fmod1a$fit.person)
##D 
##D #*** Models in which some item parameters are fixed
##D xsi.fixed <- cbind( c(1,3,9,10), c(-2, -1.2, 1.6, 2 ) )
##D mod1e <- TAM::tam.jml( resp=resp, xsi.fixed=xsi.fixed )
##D summary(mod1e)
##D 
##D #*** Model in which also some person parameters theta are fixed
##D # fix theta parameters of persons 2, 3, 4 and 33 to values -2.9, ...
##D theta.fixed <- cbind( c(2,3,4,33), c( -2.9, 4, -2.9, -2.9 ) )
##D mod1g <- TAM::tam.jml( resp=resp, xsi.fixed=xsi.fixed, theta.fixed=theta.fixed )
##D # look at estimated results
##D ind.person <- c( 1:5, 30:33 )
##D cbind( mod1g$WLE, mod1g$errorWLE )[ind.person,]
##D 
##D #############################################################################
##D # EXAMPLE 2: Partial credit model
##D #############################################################################
##D 
##D data(data.gpcm)
##D # JML estimation
##D mod2 <- TAM::tam.jml(resp=data.gpcm)
##D mod2$xsi     # extract item parameters
##D summary(mod2)
##D tam.fit(mod2)    # item and person infit/outfit statistic
##D 
##D #############################################################################
##D # EXAMPLE 3: Facet model estimation using joint maximum likelihood
##D #            data.ex10; see also Example 10 in tam.mml
##D #############################################################################
##D 
##D data(data.ex10)
##D dat <- data.ex10
##D   ## > head(dat)
##D   ##  pid rater I0001 I0002 I0003 I0004 I0005
##D   ##    1     1     0     1     1     0     0
##D   ##    1     2     1     1     1     1     0
##D   ##    1     3     1     1     1     0     1
##D   ##    2     2     1     1     1     0     1
##D   ##    2     3     1     1     0     1     1
##D 
##D facets <- dat[, "rater", drop=FALSE ] # define facet (rater)
##D pid <- dat$pid      # define person identifier (a person occurs multiple times)
##D resp <- dat[, -c(1:2) ]        # item response data
##D formulaA <- ~ item * rater      # formula
##D 
##D # use MML function only to restructure data and input obtained design matrices
##D # and processed response data to tam.jml (-> therefore use only 2 iterations)
##D mod3a <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA,
##D              pid=dat$pid,  control=list(maxiter=2) )
##D 
##D # use modified response data mod3a$resp and design matrix mod3a$A
##D resp1 <- mod3a$resp
##D # JML
##D mod3b <- TAM::tam.jml( resp=resp1, A=mod3a$A, control=list(maxiter=200) )
##D 
##D #############################################################################
##D # EXAMPLE 4: Multi faceted model with some anchored item and person parameters
##D #############################################################################
##D 
##D data(data.exJ03)
##D resp <- data.exJ03$resp
##D X <- data.exJ03$X
##D 
##D #*** (0) preprocess data with TAM::tam.mml.mfr
##D mod0 <- TAM::tam.mml.mfr( resp=resp, facets=X, pid=X$rater,
##D                 formulaA=~ leader + item + step,
##D                 control=list(maxiter=2) )
##D summary(mod0)
##D 
##D #*** (1) estimation with tam.jml (no parameter fixings)
##D 
##D # extract processed data and design matrix from tam.mml.mfr
##D resp1 <- mod0$resp
##D A1 <- mod0$A
##D # estimate model with tam.jml
##D mod1 <- TAM::tam.jml( resp=resp1, A=A1, control=list( Msteps=4, maxiter=100 ) )
##D summary(mod1)
##D 
##D #*** (2) fix some parameters (persons and items)
##D 
##D # look at indices in mod1$xsi
##D mod1$xsi
##D # fix step parameters
##D xsi.index1 <- cbind( 21:25, c( -2.44, 0.01, -0.15, 0.01,  1.55 ) )
##D # fix some item parameters of items 1,2,3,6 and 13
##D xsi.index2 <- cbind( c(1,2,3,6,13), c(-2,-1,-1,-1.32, -1 ) )
##D xsi.index <- rbind( xsi.index1, xsi.index2 )
##D # fix some theta parameters of persons 1, 15 and 20
##D theta.fixed <- cbind(  c(1,15,20), c(0.4, 1, 0 ) )
##D # estimate model, theta.fixed only works for version=1
##D mod2 <- TAM::tam.jml( resp=resp1, A=A1, xsi.fixed=xsi.fixed, theta.fixed=theta.fixed,
##D             control=list( Msteps=4, maxiter=100) )
##D summary(mod2)
##D cbind( mod2$WLE, mod2$errorWLE )
## End(Not run)



