library(sirt)


### Name: rasch.mml2
### Title: Estimation of the Generalized Logistic Item Response Model,
###   Ramsay's Quotient Model, Nonparametric Item Response Model,
###   Pseudo-Likelihood Estimation and a Missing Data Item Response Model
### Aliases: rasch.mml2 summary.rasch.mml plot.rasch.mml logLik.rasch.mml
###   anova.rasch.mml IRT.irfprob.rasch.mml IRT.likelihood.rasch.mml
###   IRT.posterior.rasch.mml IRT.modelfit.rasch.mml
###   summary.IRT.modelfit.rasch.mml
### Keywords: Marginal maximum likelihood (MML) Ramsay's quotient model
###   Nonparametric item response theory Pseudo-likelihood estimation
###   summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Reading dataset
#############################################################################

library(CDM)
data(data.read)
dat <- data.read
I <- ncol(dat) # number of items

# Rasch model
mod1 <- sirt::rasch.mml2( dat )
summary(mod1)
plot( mod1 )    # plot all items
# title 'Rasch model', display curves from -3 to 3 only for items 1, 5 and 8
plot(mod1, main="Rasch model Items 1, 5 and 8", xlim=c(-3,3), items=c(1,5,8) )

# Rasch model with constraints on item difficulties
# set item parameters of A1 and C3 equal to -2
constraints <- data.frame( c("A1","C3"), c(-2,-2) )
mod1a <- sirt::rasch.mml2( dat, constraints=constraints)
summary(mod1a)

# estimate equal item parameters for 1st and 11th item
est.b <- 1:I
est.b[11] <- 1
mod1b <- sirt::rasch.mml2( dat, est.b=est.b )
summary(mod1b)

# estimate Rasch model with skew trait distribution
mod1c <- sirt::rasch.mml2( dat, distribution.trait="smooth3")
summary(mod1c)

# 2PL model
mod2 <- sirt::rasch.mml2( dat, est.a=1:I )
summary(mod2)
plot(mod2)    # plot 2PL item response curves

# extract individual likelihood
llmod2 <- IRT.likelihood(mod2)
str(llmod2)

## Not run: 
##D library(CDM)
##D # model comparisons
##D CDM::IRT.compareModels(mod1, mod1c, mod2 )
##D anova(mod1,mod2)
##D 
##D # assess model fit
##D smod1 <- IRT.modelfit(mod1)
##D smod2 <- IRT.modelfit(mod2)
##D IRT.compareModels(smod1, smod2)
##D 
##D # set some bounds for a and b parameters
##D mod2a <- sirt::rasch.mml2( dat, est.a=1:I, min.a=.7, max.a=2, min.b=-2 )
##D summary(mod2a)
##D 
##D # 3PL model
##D mod3 <- sirt::rasch.mml2( dat, est.a=1:I, est.c=1:I,
##D               mmliter=400 # maximal 400 iterations
##D                  )
##D summary(mod3)
##D 
##D # 3PL model with fixed guessing paramters of .25 and equal slopes
##D mod4 <- sirt::rasch.mml2( dat, fixed.c=rep( .25, I )   )
##D summary(mod4)
##D 
##D # 3PL model with equal guessing paramters for all items
##D mod5 <- sirt::rasch.mml2( dat, est.c=rep(1, I )   )
##D summary(mod5)
##D 
##D # difficulty + guessing model
##D mod6 <- sirt::rasch.mml2( dat, est.c=1:I   )
##D summary(mod6)
##D 
##D # 4PL model
##D mod7 <- sirt::rasch.mml2( dat, est.a=1:I, est.c=1:I, est.d=1:I,
##D             min.d=.95, max.c=.25)
##D         # set minimal d and maximal c parameter to .95 and .25
##D summary(mod7)
##D 
##D # constrained 4PL model
##D # equal slope, guessing and slipping parameters
##D mod8 <- sirt::rasch.mml2( dat,est.c=rep(1,I), est.d=rep(1,I) )
##D summary(mod8)
##D 
##D # estimation of an item response model with an
##D # uniform theta distribution
##D theta.k <- seq( 0.01, .99, len=20 )
##D trait.weights <- rep( 1/length(theta.k), length(theta.k) )
##D mod9 <- sirt::rasch.mml2( dat, theta.k=theta.k, trait.weights=trait.weights,
##D               normal.trait=FALSE, est.a=1:12  )
##D summary(mod9)
##D 
##D #############################################################################
##D # EXAMPLE 2: Longitudinal data
##D #############################################################################
##D 
##D data(data.long)
##D dat <- data.long[,-1]
##D 
##D # define Q loading matrix
##D Qmatrix <- matrix( 0, 12, 2 )
##D Qmatrix[1:6,1] <- 1 # T1 items
##D Qmatrix[7:12,2] <- 1    # T2 items
##D 
##D # define restrictions on item difficulties
##D est.b <- c(1,2,3,4,5,6,   3,4,5,6,7,8)
##D mu.fixed <- cbind(1,0)
##D     # set first mean to 0 for identification reasons
##D 
##D # Model 1: 2-dimensional Rasch model
##D mod1 <- sirt::rasch.mml2( dat, Qmatrix=Qmatrix, miterstep=4,
##D             est.b=est.b,  mu.fixed=mu.fixed, mmliter=30 )
##D summary(mod1)
##D plot(mod1)
##D ##     Plot function is only applicable for unidimensional models
## End(Not run)

#############################################################################
# EXAMPLE 3: One group, estimation of alpha parameter in the generalized logistic model
#############################################################################

# simulate theta values
set.seed(786)
N <- 1000                  # number of persons
theta <- stats::rnorm( N, sd=1.5 ) # N persons with SD 1.5
b <- seq( -2, 2, len=15)

# simulate data
dat <- sirt::sim.raschtype( theta=theta, b=b, alpha1=0, alpha2=-0.3 )

#  estimating alpha parameters
mod1 <- sirt::rasch.mml2( dat, est.alpha=TRUE, mmliter=30 )
summary(mod1)
plot(mod1)

## Not run: 
##D # fixed alpha parameters
##D mod1b <- sirt::rasch.mml2( dat, est.alpha=FALSE, alpha1=0, alpha2=-.3 )
##D summary(mod1b)
##D 
##D # estimation with equal alpha parameters
##D mod1c <- sirt::rasch.mml2( dat, est.alpha=TRUE, equal.alpha=TRUE )
##D summary(mod1c)
##D 
##D # Ramsay QM
##D mod2a <- sirt::rasch.mml2( dat, irtmodel="ramsay.qm" )
##D summary(mod2a)
## End(Not run)

# Ramsay QM with estimated K parameters
mod2b <- sirt::rasch.mml2( dat, irtmodel="ramsay.qm", est.K=1:15, mmliter=30)
summary(mod2b)
plot(mod2b)

## Not run: 
##D # nonparametric estimation of monotone item response curves
##D mod3a <- sirt::rasch.mml2( dat, irtmodel="npirt", mmliter=100,
##D             theta.k=seq( -3, 3, len=10) ) # evaluations at 10 theta grid points
##D # nonparametric ICC of first 4 items
##D round( t(mod3a$pjk)[1:4,], 3 )
##D summary(mod3a)
##D plot(mod3a)
##D 
##D # nonparametric IRT estimation without monotonicity assumption
##D mod3b <- sirt::rasch.mml2( dat, irtmodel="npirt", mmliter=10,
##D             theta.k=seq( -3, 3, len=10), npirt.monotone=FALSE)
##D plot(mod3b)
##D 
##D # B-Spline estimation of ICCs
##D library(splines)
##D mod3c <- sirt::rasch.mml2( dat, irtmodel="npirt",
##D              npformula="y~bs(theta,df=3)", theta.k=seq(-3,3,len=15) )
##D summary(mod3c)
##D round( t(mod3c$pjk)[1:6,], 3 )
##D plot(mod3c)
##D 
##D # estimation of quadratic item response functions: ~ theta + I( theta^2)
##D mod3d <- sirt::rasch.mml2( dat, irtmodel="npirt",
##D              npformula="y~theta + I(theta^2)" )
##D summary(mod3d)
##D plot(mod3d)
##D 
##D # estimation of a stepwise ICC function
##D # ICCs are constant on the theta domains: [-Inf,-1], [-1,1], [1,Inf]
##D mod3e <- sirt::rasch.mml2( dat, irtmodel="npirt",
##D              npformula="y~I(theta>-1 )+I(theta>1)" )
##D summary(mod3e)
##D plot(mod3e, xlim=c(-2.5,2.5) )
##D 
##D # 2PL model
##D mod4 <- sirt::rasch.mml2( dat,  est.a=1:15)
##D summary(mod4)
##D 
##D #############################################################################
##D # EXAMPLE 4: Two groups, estimation of generalized logistic model
##D #############################################################################
##D 
##D # simulate generalized logistic Rasch model in two groups
##D set.seed(8765)
##D N1 <- 1000     # N1=1000 persons in group 1
##D N2 <- 500      # N2=500 persons in group 2
##D dat1 <- sirt::sim.raschtype( theta=stats::rnorm( N1, sd=1.5 ), b=b,
##D             alpha1=-0.3, alpha2=0)
##D dat2 <- sirt::sim.raschtype( theta=stats::rnorm( N2, mean=-.5, sd=.75),
##D             b=b, alpha1=-0.3, alpha2=0)
##D dat1 <- rbind( dat1, dat2 )
##D group <- c( rep(1,N1), rep(2,N2))
##D 
##D mod1 <-  sirt::rasch.mml2( dat1, parm.conv=.0001, group=group, est.alpha=TRUE )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 5: Multidimensional model
##D #############################################################################
##D 
##D #***
##D # (1) simulate data
##D set.seed(785)
##D library(mvtnorm)
##D N <- 500
##D theta <- mvtnorm::rmvnorm( N,mean=c(0,0), sigma=matrix( c(1.45,.5,.5,1.7), 2, 2 ))
##D I <- 10
##D # 10 items load on the first dimension
##D p1 <- stats::plogis( outer( theta[,1], seq( -2, 2, len=I ), "-" ) )
##D resp1 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D # 10 items load on the second dimension
##D p1 <- stats::plogis( outer( theta[,2], seq( -2, 2, len=I ), "-" ) )
##D resp2 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D #Combine the two sets of items into one response matrix
##D resp <- cbind(resp1,resp2)
##D colnames(resp) <- paste("I", 1:(2*I), sep="")
##D dat <- resp
##D 
##D # define Q-matrix
##D Qmatrix <- matrix( 0, 2*I, 2 )
##D Qmatrix[1:I,1] <- 1
##D Qmatrix[1:I+I,2] <- 1
##D 
##D #***
##D # (2) estimation of models
##D # 2-dimensional Rasch model
##D mod1 <- sirt::rasch.mml2( dat, Qmatrix=Qmatrix )
##D summary(mod1)
##D 
##D # 2-dimensional 2PL model
##D mod2 <- sirt::rasch.mml2( dat, Qmatrix=Qmatrix, est.a=1:(2*I) )
##D summary(mod2)
##D 
##D # estimation with some fixed variances and covariances
##D # set variance of 1st dimension to 1 and
##D #  covariance to zero
##D variance.fixed <- matrix( cbind(c(1,1), c(1,2), c(1,0)),
##D              byrow=FALSE, ncol=3 )
##D mod3 <- sirt::rasch.mml2( dat, Qmatrix=Qmatrix, variance.fixed=variance.fixed )
##D summary(mod3)
##D 
##D # constraints on item difficulties
##D #  useful for example in longitudinal linking
##D est.b <- c( 1:I, 1:I )
##D     # equal indices correspond to equally estimated item parameters
##D mu.fixed <- cbind( 1, 0 )
##D mod4 <- sirt::rasch.mml2( dat, Qmatrix=Qmatrix, est.b=est.b, mu.fixed=mu.fixed )
##D summary(mod4)
##D 
##D #############################################################################
##D # EXAMPLE 6: Two booklets with same items but with item context effects.
##D # Therefore, item slopes and item difficulties are assumed to be shifted in the
##D # second design group.
##D #############################################################################
##D 
##D #***
##D # simulate data
##D set.seed(987)
##D I <- 10     # number of items
##D # define person design groups 1 and 2
##D n1 <- 700
##D n2 <- 1500
##D # item difficulties group 1
##D b1 <- seq(-1.5,1.5,length=I)
##D # item slopes group 1
##D a1 <- rep(1, I)
##D # simulate data group 1
##D dat1 <- sirt::sim.raschtype( stats::rnorm(n1), b=b1, fixed.a=a1 )
##D colnames(dat1) <- paste0("I", 1:I, "des1" )
##D # group 2
##D b2 <- b1 - .15
##D a2 <- 1.1*a1
##D # Item parameters are slightly transformed in the second group
##D # compared to the first group. This indicates possible item context effects.
##D 
##D # simulate data group 2
##D dat2 <- sirt::sim.raschtype( stats::rnorm(n2), b=b2, fixed.a=a2 )
##D colnames(dat2) <- paste0("I", 1:I, "des2" )
##D # define joint dataset
##D dat <- matrix( NA, nrow=n1+n2, ncol=2*I)
##D colnames(dat) <- c( colnames(dat1), colnames(dat2) )
##D dat[ 1:n1, 1:I ] <- dat1
##D dat[ n1 + 1:n2, I + 1:I ] <- dat2
##D # define group identifier
##D group <- c( rep(1,n1), rep(2,n2) )
##D 
##D #***
##D # Model 1: Rasch model two groups
##D itemindex <- rep( 1:I, 2 )
##D mod1 <- sirt::rasch.mml2( dat, group=group, est.b=itemindex )
##D summary(mod1)
##D 
##D #***
##D # Model 2: two item slope groups and designmatrix for intercepts
##D designmatrix <- matrix( 0, 2*I, I+1)
##D designmatrix[ ( 1:I )+ I,1:I] <- designmatrix[1:I,1:I] <- diag(I)
##D designmatrix[ ( 1:I )+ I,I+1] <- 1
##D mod2 <- sirt::rasch.mml2( dat, est.a=rep(1:2,each=I), designmatrix=designmatrix )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 7: PIRLS dataset with missing responses
##D #############################################################################
##D 
##D data(data.pirlsmissing)
##D items <- grep( "R31", colnames(data.pirlsmissing), value=TRUE )
##D I <- length(items)
##D dat <- data.pirlsmissing
##D 
##D #****
##D # Model 1: recode missing responses as missing (missing are ignorable)
##D 
##D # data recoding
##D dat1 <- dat
##D dat1[ dat1==9 ] <- NA
##D # estimate Rasch model
##D mod1 <- sirt::rasch.mml2( dat1[,items], weights=dat$studwgt, group=dat$country )
##D summary(mod1)
##D ##   Mean=0 0.341 -0.134 0.219
##D ##   SD=1.142 1.166 1.197 0.959
##D 
##D #****
##D # Model 2: recode missing responses as wrong
##D 
##D # data recoding
##D dat2 <- dat
##D dat2[ dat2==9 ] <- 0
##D # estimate Rasch model
##D mod2 <- sirt::rasch.mml2( dat2[,items], weights=dat$studwgt, group=dat$country )
##D summary(mod2)
##D   ##   Mean=0 0.413 -0.172 0.446
##D   ##   SD=1.199 1.263 1.32 0.996
##D 
##D #****
##D # Model 3: recode missing responses as rho * P_i( theta ) and
##D #          apply pseudo-log-likelihood estimation
##D # Missing item responses are predicted by the model implied probability
##D # P_i( theta ) where theta is the ability estimate when ignoring missings (Model 1)
##D # and rho is an adjustment parameter. rho=0 is equivalent to Model 2 (treating
##D # missing as wrong) and rho=1 is equivalent to Model 1 (treating missing as ignorable).
##D 
##D # data recoding
##D dat3 <- dat
##D # simulate theta estimate from posterior distribution
##D theta <- stats::rnorm( nrow(dat3), mean=mod1$person$EAP, sd=mod1$person$SE.EAP )
##D rho <- .3   # define a rho parameter value of .3
##D for (ii in items){
##D     ind <- which( dat[,ii]==9 )
##D     dat3[ind,ii] <- rho*stats::plogis( theta[ind] - mod1$item$b[ which( items==ii ) ] )
##D                 }
##D 
##D # estimate Rasch model
##D mod3 <- sirt::rasch.mml2( dat3[,items], weights=dat$studwgt, group=dat$country )
##D summary(mod3)
##D   ##   Mean=0 0.392 -0.153 0.38
##D   ##   SD=1.154 1.209 1.246 0.973
##D 
##D #****
##D # Model 4: simulate missing responses as rho * P_i( theta )
##D # The definition is the same as in Model 3. But it is now assumed
##D # that the missing responses are 'latent responses'.
##D set.seed(789)
##D 
##D # data recoding
##D dat4 <- dat
##D # simulate theta estimate from posterior distribution
##D theta <- stats::rnorm( nrow(dat4), mean=mod1$person$EAP, sd=mod1$person$SE.EAP )
##D rho <- .3   # define a rho parameter value of .3
##D for (ii in items){
##D     ind <- which( dat[,ii]==9 )
##D     p3 <- rho*stats::plogis( theta[ind] - mod1$item$b[ which( items==ii ) ] )
##D     dat4[ ind, ii ] <- 1*( stats::runif( length(ind), 0, 1 ) < p3)
##D                 }
##D 
##D # estimate Rasch model
##D mod4 <- sirt::rasch.mml2( dat4[,items], weights=dat$studwgt, group=dat$country )
##D summary(mod4)
##D   ##   Mean=0 0.396 -0.156 0.382
##D   ##   SD=1.16 1.216 1.253 0.979
##D 
##D #****
##D # Model 5: recode missing responses for multiple choice items with four alternatives
##D #          to 1/4 and apply pseudo-log-likelihood estimation.
##D #          Missings for constructed response items are treated as incorrect.
##D 
##D # data recoding
##D dat5 <- dat
##D items_mc <- items[ substring( items, 7,7)=="M" ]
##D items_cr <- items[ substring( items, 7,7)=="C" ]
##D for (ii in items_mc){
##D     ind <- which( dat[,ii]==9 )
##D     dat5[ind,ii] <- 1/4
##D                 }
##D for (ii in items_cr){
##D     ind <- which( dat[,ii]==9 )
##D     dat5[ind,ii] <- 0
##D                 }
##D 
##D # estimate Rasch model
##D mod5 <- sirt::rasch.mml2( dat5[,items], weights=dat$studwgt, group=dat$country )
##D summary(mod5)
##D   ##   Mean=0 0.411 -0.165 0.435
##D   ##   SD=1.19 1.245 1.293 0.995
##D 
##D #*** For the following analyses, we ignore sample weights and the
##D #    country grouping.
##D data(data.pirlsmissing)
##D items <- grep( "R31", colnames(data.pirlsmissing), value=TRUE )
##D dat <- data.pirlsmissing
##D dat1 <- dat
##D dat1[ dat1==9 ] <- 0
##D 
##D #*** Model 6: estimate item difficulties assuming incorrect missing data treatment
##D mod6 <- sirt::rasch.mml2( dat1[,items], mmliter=50 )
##D summary(mod6)
##D 
##D #*** Model 7: reestimate model with constrained item difficulties
##D I <- length(items)
##D constraints <- cbind( 1:I, mod6$item$b )
##D mod7 <- sirt::rasch.mml2( dat1[,items], constraints=constraints, mmliter=50 )
##D summary(mod7)
##D 
##D #*** Model 8: score all missings responses as missing items
##D dat2 <- dat[,items]
##D dat2[ dat2==9 ] <- NA
##D mod8 <- sirt::rasch.mml2( dat2, constraints=constraints, mmliter=50, mu.fixed=NULL )
##D summary(mod8)
##D 
##D #*** Model 9: estimate missing data model 'missing1' assuming a missingness
##D #       parameter delta.miss of zero
##D dat2 <-  dat[,items]    # note that missing item responses must be defined by 9
##D mod9 <- sirt::rasch.mml2( dat2, constraints=constraints, irtmodel="missing1",
##D             theta.k=seq(-5,5,len=10), delta.miss=0, mitermax=4, mmliter=200,
##D             mu.fixed=NULL )
##D summary(mod9)
##D 
##D #*** Model 10: estimate missing data model with a large negative missing delta parameter
##D #    => This model is equivalent to treating missing responses as wrong
##D mod10 <- sirt::rasch.mml2( dat2, constraints=constraints, irtmodel="missing1",
##D              theta.k=seq(-5, 5, len=10), delta.miss=-10, mitermax=4, mmliter=200,
##D              mu.fixed=NULL )
##D summary(mod10)
##D 
##D #*** Model 11: choose a missingness delta parameter of -1
##D mod11 <- sirt::rasch.mml2( dat2, constraints=constraints, irtmodel="missing1",
##D              theta.k=seq(-5, 5, len=10), delta.miss=-1, mitermax=4,
##D              mmliter=200, mu.fixed=NULL )
##D summary(mod11)
##D 
##D #*** Model 12: estimate joint delta parameter
##D mod12 <- sirt::rasch.mml2( dat2, irtmodel="missing1", mu.fixed=cbind( c(1,2), 0 ),
##D              theta.k=seq(-8, 8, len=10), delta.miss=0, mitermax=4,
##D              mmliter=30, est.delta=rep(1,I)  )
##D summary(mod12)
##D 
##D #*** Model 13: estimate delta parameter in item groups defined by item format
##D est.delta <- 1 + 1 * ( substring( colnames(dat2),7,7 )=="M" )
##D mod13 <- sirt::rasch.mml2( dat2, irtmodel="missing1", mu.fixed=cbind( c(1,2), 0 ),
##D              theta.k=seq(-8, 8, len=10), delta.miss=0, mitermax=4,
##D              mmliter=30, est.delta=est.delta  )
##D summary(mod13)
##D 
##D #*** Model 14: estimate item specific delta parameter
##D mod14 <- sirt::rasch.mml2( dat2, irtmodel="missing1", mu.fixed=cbind( c(1,2), 0 ),
##D              theta.k=seq(-8, 8, len=10), delta.miss=0, mitermax=4,
##D              mmliter=30, est.delta=1:I  )
##D summary(mod14)
##D 
##D #############################################################################
##D # EXAMPLE 8: Comparison of different models for polytomous data
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D head(data.Students)
##D dat <- data.Students[, paste0("act",1:5) ]
##D I <- ncol(dat)
##D 
##D #**************************************************
##D #*** Model 1: Partial Credit Model (PCM)
##D 
##D #*** Model 1a: PCM in TAM
##D mod1a <- TAM::tam.mml( dat )
##D summary(mod1a)
##D 
##D #*** Model 1b: PCM in sirt
##D mod1b <- sirt::rm.facets( dat )
##D summary(mod1b)
##D 
##D #*** Model 1c: PCM in mirt
##D mod1c <- mirt::mirt( dat, 1, itemtype=rep("Rasch",I), verbose=TRUE )
##D print(mod1c)
##D 
##D #**************************************************
##D #*** Model 2: Sequential Model (SM): Equal Loadings
##D 
##D #*** Model 2a: SM in sirt
##D dat1 <- CDM::sequential.items(dat)
##D resp <- dat1$dat.expand
##D iteminfo <- dat1$iteminfo
##D # fit model
##D mod2a <- sirt::rasch.mml2( resp )
##D summary(mod2a)
##D 
##D #**************************************************
##D #*** Model 3: Sequential Model (SM): Different Loadings
##D 
##D #*** Model 3a: SM in sirt
##D mod3a <- sirt::rasch.mml2( resp, est.a=iteminfo$itemindex )
##D summary(mod3a)
##D 
##D #**************************************************
##D #*** Model 4: Generalized partial credit model (GPCM)
##D 
##D #*** Model 4a: GPCM in TAM
##D mod4a <- TAM::tam.mml.2pl( dat, irtmodel="GPCM")
##D summary(mod4a)
##D 
##D #**************************************************
##D #*** Model 5: Graded response model (GRM)
##D 
##D #*** Model 5a: GRM in mirt
##D mod5a <- mirt::mirt( dat, 1, itemtype=rep("graded",I), verbose=TRUE)
##D print(mod5a)
##D 
##D # model comparison
##D logLik(mod1a);logLik(mod1b);mod1c@logLik  # PCM
##D logLik(mod2a)   # SM (Rasch)
##D logLik(mod3a)   # SM (GPCM)
##D logLik(mod4a)   # GPCM
##D mod5a@logLik    # GRM
## End(Not run)



