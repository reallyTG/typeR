library(TAM)


### Name: tam.mml
### Title: Test Analysis Modules: Marginal Maximum Likelihood Estimation
### Aliases: tam tam.mml tam.mml.2pl tam.mml.mfr summary.tam
###   summary.tam.mml print.tam print.tam.mml prior_list_include
### Keywords: Marginal maximum likelihood estimation (MML) Multidimensional
###   item response model summary

### ** Examples

#############################################################################
# EXAMPLE 1: dichotomous data
# data.sim.rasch: 2000 persons, 40 items
#############################################################################
data(data.sim.rasch)

#************************************************************
# Model 1: Rasch model (MML estimation)
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
# extract item parameters
mod1$item    # item difficulties

## Not run: 
##D # WLE estimation
##D wle1 <- TAM::tam.wle( mod1 )
##D # item fit
##D fit1 <- TAM::tam.fit(mod1)
##D # plausible value imputation
##D pv1 <- TAM::tam.pv(mod1, normal.approx=TRUE, ntheta=300)
##D # standard errors
##D se1 <- TAM::tam.se( mod1 )
##D # summary
##D summary(mod1)
##D 
##D #-- specification with tamaan
##D tammodel <- "
##D  LAVAAN MODEL:
##D    F=~ I1__I40;
##D    F ~~ F
##D  ITEM TYPE:
##D    ALL(Rasch)
##D    "
##D mod1t <- TAM::tamaan( tammodel, data.sim.rasch)
##D summary(mod1t)
##D 
##D #************************************************************
##D # Model 1a: Rasch model with fixed item difficulties from 'mod1'
##D xsi0 <- mod1$xsi$xsi
##D xsi.fixed <- cbind( 1:(length(xsi0)), xsi0 )
##D         # define vector with fixed item difficulties
##D mod1a <- TAM::tam.mml( resp=data.sim.rasch, xsi.fixed=xsi.fixed )
##D summary(mod1a)
##D 
##D # Usage of the output value mod1$xsi.fixed.estimated has the right format
##D # as the input of xsi.fixed
##D mod1aa <- TAM::tam.mml( resp=data.sim.rasch, xsi.fixed=mod1$xsi.fixed.estimated )
##D summary(mod1b)
##D 
##D #************************************************************
##D # Model 1b: Rasch model with initial xsi parameters for items 2 (item difficulty b=-1.8),
##D # item 4 (b=-1.6) and item 40 (b=2)
##D xsi.inits <- cbind( c(2,4,40), c(-1.8,-1.6,2))
##D mod1b <- TAM::tam.mml( resp=data.sim.rasch, xsi.inits=xsi.inits )
##D 
##D #-- tamaan specification
##D tammodel <- "
##D  LAVAAN MODEL:
##D    F=~ I1__I40
##D    F ~~ F
##D    # Fix item difficulties. Note that item intercepts instead of difficulties
##D    # must be specified.
##D    I2 | 1.8*t1
##D    I4 | 1.6*t1
##D  ITEM TYPE:
##D    ALL(Rasch)
##D    "
##D mod1bt <- TAM::tamaan( tammodel, data.sim.rasch)
##D summary(mod1bt)
##D 
##D #************************************************************
##D # Model 1c: 1PL estimation with sum constraint on item difficulties
##D dat <- data.sim.rasch
##D # modify A design matrix to include the sum constraint
##D des <- TAM::designMatrices(resp=dat)
##D A1 <- des$A[,, - ncol(dat) ]
##D A1[ ncol(dat),2, ] <- 1
##D A1[,2,]
##D # estimate model
##D mod1c <- TAM::tam.mml( resp=dat, A=A1, beta.fixed=FALSE,
##D            control=list(fac.oldxsi=.1) )
##D summary(mod1c)
##D 
##D #************************************************************
##D # Model 1d: estimate constraint='items' using tam.mml.mfr
##D formulaA=~ 0 + item
##D mod1d <- TAM::tam.mml.mfr( resp=dat, formulaA=formulaA,
##D                      control=list(fac.oldxsi=.1), constraint="items")
##D summary(mod1d)
##D 
##D #************************************************************
##D # Model 1e: This sum constraint can also be obtained by using the argument
##D # constraint="items" in tam.mml
##D mod1e <- TAM::tam.mml( resp=data.sim.rasch, constraint="items" )
##D summary(mod1e)
##D 
##D #************************************************************
##D # Model 1d2: estimate constraint='items' using tam.mml.mfr
##D # long format response data
##D resp.long <- c(dat)
##D 
##D # pid and item facet specifications are necessary
##D #     Note, that we recommend the facet labels to be sortable in the same order that the
##D #     results are desired.
##D #     compare to: facets <- data.frame( "item"=rep(colnames(dat), each=nrow(dat)) )
##D pid <- rep(1:nrow(dat), ncol(dat))
##D itemnames <- paste0("I", sprintf(paste('%0', max(nchar(1:ncol(dat))), 'i', sep='' ),
##D                     c(1:ncol(dat)) ) )
##D facets   <- data.frame( "item"=rep(itemnames, each=nrow(dat)) )
##D 
##D mod1d2 <- TAM::tam.mml.mfr( resp=resp.long, formulaA=formulaA, control=list(fac.oldxsi=.1),
##D                        constraint="items", facets=facets, pid=pid)
##D stopifnot( all(mod1d$xsi.facets$xsi==mod1d2$xsi.facets$xsi) )
## End(Not run)


#************************************************************
# Model 2: 2PL model
mod2 <- TAM::tam.mml.2pl(resp=data.sim.rasch,irtmodel="2PL")

# extract item parameters
mod2$xsi    # item difficulties
mod2$B      # item slopes

#--- tamaan specification
tammodel <- "
 LAVAAN MODEL:
   F=~ I1__I40
   F ~~ 1*F
   # item type of 2PL is the default for dichotomous data
   "
# estimate model
mod2t <- TAM::tamaan( tammodel, data.sim.rasch)
summary(mod2t)

## Not run: 
##D #************************************************************
##D # Model 2a: 2PL with fixed item difficulties and slopes from 'mod2'
##D xsi0 <- mod2$xsi$xsi
##D xsi.fixed <- cbind( 1:(length(xsi0)), xsi0 )
##D         # define vector with fixed item difficulties
##D mod2a <- TAM::tam.mml( resp=data.sim.rasch, xsi.fixed=xsi.fixed,
##D                  B=mod2$B # fix slopes
##D             )
##D summary(mod2a)
##D mod2a$B     # inspect used slope matrix
##D 
##D #************************************************************
##D # Model 3: constrained 2PL estimation
##D # estimate item parameters in different slope groups
##D # items 1-10, 21-30 group 1
##D # items 11-20 group 2 and items 31-40 group 3
##D est.slope <- rep(1,40)
##D est.slope[ 11:20 ] <- 2
##D est.slope[ 31:40 ] <- 3
##D mod3 <- TAM::tam.mml.2pl( resp=data.sim.rasch, irtmodel="2PL.groups",
##D                est.slopegroups=est.slope )
##D mod3$B
##D summary(mod3)
##D 
##D #--- tamaan specification (A)
##D tammodel <- "
##D  LAVAAN MODEL:
##D    F=~ lam1*I1__I10 + lam2*I11__I20 + lam1*I21__I30 + lam3*I31__I40;
##D    F ~~ 1*F
##D    "
##D # estimate model
##D mod3tA <- TAM::tamaan( tammodel, data.sim.rasch)
##D summary(mod3tA)
##D 
##D #--- tamaan specification (alternative B)
##D tammodel <- "
##D  LAVAAN MODEL:
##D    F=~ a1__a40*I1__I40;
##D    F ~~ 1*F
##D  MODEL CONSTRAINT:
##D    a1__a10==lam1
##D    a11__a20==lam2
##D    a21__a30==lam1
##D    a31__a40==lam3
##D    "
##D mod3tB <- TAM::tamaan( tammodel, data.sim.rasch)
##D summary(mod3tB)
##D 
##D #--- tamaan specification (alternative C using DO operator)
##D tammodel <- "
##D  LAVAAN MODEL:
##D  DO(1,10,1)
##D    F=~ lam1*I%
##D  DOEND
##D  DO(11,20,1)
##D    F=~ lam2*I%
##D  DOEND
##D  DO(21,30,1)
##D    F=~ lam1*I%
##D  DOEND
##D  DO(31,40,1)
##D    F=~ lam3*I%
##D  DOEND
##D    F ~~ 1*F
##D    "
##D # estimate model
##D mod3tC <- TAM::tamaan( tammodel, data.sim.rasch)
##D summary(mod3tC)
##D 
##D #############################################################################
##D # EXAMPLE 2: Unidimensional calibration with latent regressors
##D #############################################################################
##D 
##D # (1) simulate data
##D set.seed(6778)     # set simulation seed
##D N <- 2000          # number of persons
##D # latent regressors Y
##D Y <- cbind( stats::rnorm( N, sd=1.5), stats::rnorm(N, sd=.3 ) )
##D # simulate theta
##D theta <- stats::rnorm( N ) + .4 * Y[,1] + .2 * Y[,2]  # latent regression model
##D # number of items
##D I <- 40
##D p1 <- stats::plogis( outer( theta, seq( -2, 2, len=I ), "-" ) )
##D # simulate response matrix
##D resp <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D colnames(resp) <- paste("I", 1:I, sep="")
##D 
##D # (2) estimate model
##D mod2_1 <- TAM::tam.mml(resp=resp, Y=Y)
##D summary(mod2_1)
##D 
##D # (3) setting initial values for beta coefficients
##D #   beta_2=.20, beta_3=.35 for dimension 1
##D beta.inits <- cbind( c(2,3), 1, c(.2, .35 ) )
##D mod2_2 <- TAM::tam.mml(resp=resp, Y=Y, beta.inits=beta.inits)
##D 
##D # (4) fix intercept to zero and third coefficient to .3
##D beta.fixed <- cbind( c(1,3), 1, c(0, .3 ) )
##D mod2_3 <- TAM::tam.mml(resp=resp, Y=Y, beta.fixed=beta.fixed )
##D 
##D # (5) same model but with R regression formula for Y
##D dataY <- data.frame(Y)
##D colnames(dataY) <- c("Y1","Y2")
##D mod2_4 <- TAM::tam.mml(resp=resp, dataY=dataY, formulaY=~ Y1+Y2 )
##D summary(mod2_4)
##D 
##D # (6) model with interaction of regressors
##D mod2_5 <- TAM::tam.mml(resp=resp, dataY=dataY, formulaY=~ Y1*Y2 )
##D summary(mod2_5)
##D 
##D # (7) no constraint on regressors (removing constraint from intercept)
##D mod2_6 <- TAM::tam.mml(resp=resp, Y=Y, beta.fixed=FALSE )
##D 
##D #############################################################################
##D # EXAMPLE 3: Multiple group estimation
##D #############################################################################
##D 
##D # (1) simulate data
##D set.seed(6778)
##D N <- 3000
##D theta <- c( stats::rnorm(N/2,mean=0,sd=1.5), stats::rnorm(N/2,mean=.5,sd=1)  )
##D I <- 20
##D p1 <- stats::plogis( outer( theta, seq( -2, 2, len=I ), "-" ) )
##D resp <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D colnames(resp) <- paste("I", 1:I, sep="")
##D group <- rep(1:2, each=N/2 )
##D 
##D # (2) estimate model
##D mod3_1 <- TAM::tam.mml( resp,  group=group )
##D summary(mod3_1)
##D 
##D #############################################################################
##D # EXAMPLE 4: Multidimensional estimation
##D # with two dimensional theta's - simulate some bivariate data,
##D # and regressors
##D # 40 items: first 20 items load on dimension 1,
##D #           second 20 items load on dimension 2
##D #############################################################################
##D 
##D # (1) simulate some data
##D set.seed(6778)
##D library(mvtnorm)
##D N <- 1000
##D Y <- cbind( stats::rnorm( N ), stats::rnorm(N) )
##D theta <- mvtnorm::rmvnorm( N,mean=c(0,0), sigma=matrix( c(1,.5,.5,1), 2, 2 ))
##D theta[,1] <- theta[,1] + .4 * Y[,1] + .2 * Y[,2]  # latent regression model
##D theta[,2] <- theta[,2] + .8 * Y[,1] + .5 * Y[,2]  # latent regression model
##D I <- 20
##D p1 <- stats::plogis( outer( theta[,1], seq( -2, 2, len=I ), "-" ) )
##D resp1 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D p1 <- stats::plogis( outer( theta[,2], seq( -2, 2, len=I ), "-" ) )
##D resp2 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D resp <- cbind(resp1,resp2)
##D colnames(resp) <- paste("I", 1:(2*I), sep="")
##D 
##D # (2) define loading Matrix
##D Q <- array( 0, dim=c( 2*I, 2 ))
##D Q[cbind(1:(2*I), c( rep(1,I), rep(2,I) ))] <- 1
##D 
##D # (3) estimate models
##D 
##D #************************************************************
##D # Model 4.1: Rasch model: without regressors
##D mod4_1 <- TAM::tam.mml( resp=resp, Q=Q )
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F1=~ 1*I1__I20
##D     F2=~ 1*I21__I40
##D     # Alternatively to the factor 1 one can use the item type Rasch
##D     F1 ~~ F1
##D     F2 ~~ F2
##D     F1 ~~ F2
##D     "
##D mod4_1t <- TAM::tamaan( tammodel, resp, control=list(maxiter=100))
##D summary(mod4_1t)
##D 
##D #************************************************************
##D # Model 4.1b: estimate model with sum constraint of items for each dimension
##D mod4_1b <- TAM::tam.mml( resp=resp, Q=Q,constraint="items")
##D 
##D #************************************************************
##D # Model 4.2: Rasch model: set covariance between dimensions to zero
##D variance_fixed <- cbind( 1, 2, 0 )
##D mod4_2 <- TAM::tam.mml( resp=resp, Q=Q, variance.fixed=variance_fixed )
##D summary(mod4_2)
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F1=~ I1__I20
##D     F2=~ I21__I40
##D     F1 ~~ F1
##D     F2 ~~ F2
##D     F1 ~~ 0*F2
##D   ITEM TYPE:
##D     ALL(Rasch)
##D     "
##D mod4_2t <- TAM::tamaan( tammodel, resp)
##D summary(mod4_2t)
##D 
##D #************************************************************
##D # Model 4.3: 2PL model
##D mod4_3 <- TAM::tam.mml.2pl( resp=resp, Q=Q, irtmodel="2PL" )
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F1=~ I1__I20
##D     F2=~ I21__I40
##D     F1 ~~ F1
##D     F2 ~~ F2
##D     F1 ~~ F2
##D     "
##D mod4_3t <- TAM::tamaan( tammodel, resp )
##D summary(mod4_3t)
##D 
##D #************************************************************
##D # Model 4.4: Rasch model with 2000 quasi monte carlo nodes
##D # -> nodes are useful for more than 3 or 4 dimensions
##D mod4_4 <- TAM::tam.mml( resp=resp, Q=Q, control=list(snodes=2000) )
##D 
##D #************************************************************
##D # Model 4.5: Rasch model with 2000 stochastic nodes
##D mod4_5 <- TAM::tam.mml( resp=resp, Q=Q,control=list(snodes=2000,QMC=FALSE))
##D 
##D #************************************************************
##D # Model 4.6: estimate two dimensional Rasch model with regressors
##D mod4_6 <- TAM::tam.mml( resp=resp, Y=Y, Q=Q )
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F1=~ I1__I20
##D     F2=~ I21__I40
##D     F1 ~~ F1
##D     F2 ~~ F2
##D     F1 ~~ F2
##D   ITEM TYPE:
##D     ALL(Rasch)
##D     "
##D mod4_6t <- TAM::tamaan( tammodel, resp, Y=Y )
##D summary(mod4_6t)
##D 
##D #############################################################################
##D # EXAMPLE 5: 2-dimensional estimation with within item dimensionality
##D #############################################################################
##D library(mvtnorm)
##D # (1) simulate data
##D set.seed(4762)
##D N <- 2000 # 2000 persons
##D Y <- stats::rnorm( N )
##D theta <- mvtnorm::rmvnorm( N,mean=c(0,0), sigma=matrix( c(1,.5,.5,1), 2, 2 ))
##D I <- 10
##D # 10 items load on the first dimension
##D p1 <- stats::plogis( outer( theta[,1], seq( -2, 2, len=I ), "-" ) )
##D resp1 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D # 10 items load on the second dimension
##D p1 <- stats::plogis( outer( theta[,2], seq( -2, 2, len=I ), "-" ) )
##D resp2 <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D # 20 items load on both dimensions
##D p1 <- stats::plogis( outer( 0.5*theta[,1] + 1.5*theta[,2], seq(-2,2,len=2*I ), "-" ))
##D resp3 <- 1 * ( p1 > matrix( stats::runif( N*2*I ), nrow=N, ncol=2*I ) )
##D #Combine the two sets of items into one response matrix
##D resp <- cbind(resp1, resp2, resp3 )
##D colnames(resp) <- paste("I", 1:(4*I), sep="")
##D 
##D # (2) define loading matrix
##D Q <- cbind(c(rep(1,10),rep(0,10),rep(1,20)), c(rep(0,10),rep(1,10),rep(1,20)))
##D 
##D # (3) model: within item dimensionality and 2PL estimation
##D mod5 <- TAM::tam.mml.2pl(resp, Q=Q, irtmodel="2PL" )
##D summary(mod5)
##D 
##D # item difficulties
##D mod5$item
##D # item loadings
##D mod5$B
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F1=~ I1__I10 + I21__I40
##D     F2=~ I11__I20 + I21__I40
##D     F1 ~~ 1*F1
##D     F1 ~~ F2
##D     F2 ~~ 1*F2
##D     "
##D mod5t <- TAM::tamaan( tammodel, resp,  control=list(maxiter=10))
##D summary(mod5t)
##D 
##D #############################################################################
##D # EXAMPLE 6: ordered data - Generalized partial credit model
##D #############################################################################
##D data(data.gpcm, package="TAM")
##D 
##D #************************************************************
##D # Ex6.1: Nominal response model (irtmodel="2PL")
##D mod6_1 <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="2PL", control=list(maxiter=200) )
##D mod6_1$item # item intercepts
##D mod6_1$B    # for every category a separate slope parameter is estimated
##D 
##D # reestimate the model with fixed item parameters
##D mod6_1a <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="2PL",
##D        xsi.fixed=mod6_1$xsi.fixed.estimated,  B.fixed=mod6_1$B.fixed.estimated )
##D 
##D # estimate the model with initial item parameters from mod6_1
##D mod6_1b <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="2PL",
##D        xsi.inits=mod6_1$xsi.fixed.estimated,  B=mod6_1$B )
##D 
##D #************************************************************
##D # Ex6.2: Generalized partial credit model
##D mod6_2 <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="GPCM", control=list(maxiter=200))
##D mod6_2$B[,2,]    # joint slope parameter for all categories
##D 
##D #************************************************************
##D # Ex6.3: some fixed entries of slope matrix B
##D # B: nitems x maxK x ndim
##D #   ( number of items x maximum number of categories x number of dimensions)
##D # set two constraints
##D B.fixed <- matrix( 0, 2, 4 )
##D # set second item, score of 2 (category 3), at first dimension to 2.3
##D B.fixed[1,] <- c(2,3,1,2.3)
##D # set third item, score of 1 (category 2), at first dimension to 1.4
##D B.fixed[2,] <- c(3,2,1,1.4)
##D 
##D # estimate item parameter with variance fixed (by default)
##D mod6_3 <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="2PL", B.fixed=B.fixed,
##D                  control=list( maxiter=200) )
##D mod6_3$B
##D 
##D #************************************************************
##D # Ex 6.4: estimate the same model, but estimate variance
##D mod6_4 <- TAM::tam.mml.2pl( resp=data.gpcm, irtmodel="2PL", B.fixed=B.fixed,
##D                est.variance=TRUE, control=list( maxiter=350) )
##D mod6_4$B
##D 
##D #************************************************************
##D # Ex 6.5: partial credit model
##D mod6_5 <- TAM::tam.mml( resp=data.gpcm,control=list( maxiter=200) )
##D mod6_5$B
##D 
##D #************************************************************
##D # Ex 6.6: partial credit model: Conquest parametrization 'item+item*step'
##D mod6_6 <- TAM::tam.mml( resp=data.gpcm, irtmodel="PCM2" )
##D summary(mod6_6)
##D 
##D # estimate mod6_6 applying the sum constraint of item difficulties
##D # modify design matrix of xsi paramters
##D A1 <- TAM::.A.PCM2(resp=data.gpcm )
##D A1[3,2:4,"Comfort"] <- 1:3
##D A1[3,2:4,"Work"] <- 1:3
##D A1 <- A1[,, -3] # remove Benefit xsi item parameter
##D # estimate model
##D mod6_6b <- TAM::tam.mml( resp=data.gpcm, A=A1, beta.fixed=FALSE )
##D summary(mod6_6b)
##D 
##D # estimate model with argument constraint="items"
##D mod6_6c <- TAM::tam.mml( resp=data.gpcm, irtmodel="PCM2", constraint="items")
##D 
##D # estimate mod6_6 using tam.mml.mfr
##D mod6_6d <- TAM::tam.mml.mfr( resp=data.gpcm, formulaA=~ 0 + item + item:step,
##D     control=list(fac.oldxsi=.1), constraint="items" )
##D summary(mod6_6d)
##D 
##D #************************************************************
##D # Ex 6.7: Rating scale model: Conquest parametrization 'item+step'
##D mod6_7 <- TAM::tam.mml( resp=data.gpcm, irtmodel="RSM" )
##D summary(mod6_7)
##D 
##D #************************************************************
##D # Ex 6.8: sum constraint on item difficulties
##D #         partial credit model: ConQuest parametrization 'item+item*step'
##D #         polytomous scored TIMMS data
##D #         compare to Example 16
##D #
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored[,1:11]
##D 
##D ## > tail(sort(names(dat)),1) # constrained item
##D ## [1] "M032761"
##D 
##D # modify design matrix of xsi paramters
##D A1 <- TAM::.A.PCM2( resp=dat )
##D # constrained item loads on every other main item parameter
##D # with opposing margin it had been loaded on its own main item parameter
##D A1["M032761",,setdiff(colnames(dat), "M032761")] <- -A1["M032761",,"M032761"]
##D # remove main item parameter for constrained item
##D A1 <- A1[,, setdiff(dimnames(A1)[[3]],"M032761")]
##D 
##D # estimate model
##D mod6_8a <- TAM::tam.mml( resp=dat, A=A1, beta.fixed=FALSE )
##D summary(mod6_8a)
##D # extract fixed item parameter for item M032761
##D ## - sum(mod6_8a$xsi[setdiff(colnames(dat), "M032761"),"xsi"])
##D 
##D # estimate mod6_8a using tam.mml.mfr
##D ## fixed a bug in 'tam.mml.mfr' for differing number of categories
##D ## per item -> now a xsi vector with parameter fixings to values
##D ## of 99 is used
##D mod6_8b <- TAM::tam.mml.mfr( resp=dat, formulaA=~ 0 + item + item:step,
##D                         control=list(fac.oldxsi=.1), constraint="items" )
##D summary(mod6_8b)
##D 
##D #************************************************************
##D # Ex 6.9: sum constraint on item difficulties for irtmodel="PCM"
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored[,2:11]
##D dat[ dat==9 ] <- NA
##D 
##D # obtain the design matrix for the PCM parametrization and
##D # the number of categories for each item
##D maxKi <- apply(dat, 2, max, na.rm=TRUE)
##D des <- TAM::designMatrices(resp=dat)
##D A1 <- des$A
##D 
##D # define the constrained item category and remove the respective parameter
##D (par <- unlist( strsplit(dimnames(A1)[[3]][dim(A1)[3]], split="_") ))
##D A1 <- A1[,,-dim(A1)[3]]
##D 
##D # the item category loads on every other item category parameter with
##D # opposing margin, balancing the number of categories for each item
##D item.id <- which(colnames(dat)==par[1])
##D cat.id <- maxKi[par[1]]+1
##D loading <- 1/rep(maxKi, maxKi)
##D loading <- loading [-which(names(loading)==par[1])[1]]
##D A1[item.id, cat.id, ] <- loading
##D A1[item.id,,]
##D 
##D # estimate model
##D mod6_9 <- TAM::tam.mml( resp=dat, A=A1, beta.fixed=FALSE )
##D summary(mod6_9)
##D 
##D ## extract fixed item category parameter
##D # calculate mean for each item
##D ind.item.cat.pars <- sapply(colnames(dat), grep, rownames(mod6_8$xsi))
##D item.means <- lapply(ind.item.cat.pars, function(ii) mean(mod6_8$xsi$xsi[ii]))
##D 
##D # these sum up to the negative of the fixed parameter
##D fix.par <- -sum( unlist(item.means), na.rm=TRUE)
##D 
##D #************************************************************
##D # Ex 6.10: Generalized partial credit model with equality constraints
##D #          on item discriminations
##D 
##D data(data.gpcm)
##D dat <- data.gpcm
##D 
##D # Ex 6.10a: set all slopes of three items equal to each other
##D E <- matrix( 1, nrow=3, ncol=1 )
##D mod6_10a <- TAM::tam.mml.2pl( dat, irtmodel="GPCM.design", E=E  )
##D summary(mod6_10a)
##D mod6_10a$B[,,]
##D 
##D # Ex 6.10b: equal slope for first and third item
##D E <- matrix( 0, nrow=3, ncol=2 )
##D E[c(1,3),1] <- 1
##D E[ 2, 2 ] <- 1
##D mod6_10b <- TAM::tam.mml.2pl( dat, irtmodel="GPCM.design", E=E  )
##D summary(mod6_10b)
##D mod6_10b$B[,,]
##D 
##D #############################################################################
##D # EXAMPLE 7: design matrix for slopes for the generalized partial credit model
##D #############################################################################
##D 
##D # (1) simulate data from a model with a (item slope) design matrix E
##D set.seed(789)
##D I <- 42
##D b <- seq( -2, 2, len=I)
##D # create design matrix for loadings
##D E <- matrix( 0, I, 5 )
##D E[ seq(1,I,3), 1 ] <- 1
##D E[ seq(2,I,3), 2 ] <- 1
##D E[ seq(3,I,3), 3 ] <- 1
##D ind <- seq( 1, I, 2 ) ; E[ ind, 4 ] <- rep( c( .3, -.2 ), I )[ 1:length(ind) ]
##D ind <- seq( 2, I, 4 ) ; E[ ind, 5 ] <- rep( .15, I )[ 1:length(ind) ]
##D E
##D 
##D # true basis slope parameters
##D lambda <- c( 1, 1.2, 0.8, 1, 1.1 )
##D # calculate item slopes
##D a <- E %*% lambda
##D 
##D # simulate
##D N <- 4000
##D theta <- stats::rnorm( N )
##D aM <- outer( rep(1,N), a[,1] )
##D bM <- outer( rep(1,N), b )
##D pM <- stats::plogis( aM * ( matrix( theta, nrow=N, ncol=I  ) - bM ) )
##D dat <- 1 * ( pM > stats::runif( N*I ) )
##D colnames(dat) <- paste("I", 1:I, sep="")
##D 
##D # estimate model
##D mod7 <- TAM::tam.mml.2pl( resp=dat, irtmodel="GPCM.design", E=E )
##D mod7$B
##D 
##D # recalculate estimated basis parameters
##D stats::lm( mod7$B[,2,1] ~ 0+ as.matrix(E ) )
##D   ##   Call:
##D   ##   lm(formula=mod7$B[, 2, 1] ~ 0 + as.matrix(E))
##D   ##   Coefficients:
##D   ##   as.matrix(E)1  as.matrix(E)2  as.matrix(E)3  as.matrix(E)4  as.matrix(E)5
##D   ##          0.9904         1.1896         0.7817         0.9601         1.2132
##D 
##D #############################################################################
##D # EXAMPLE 8: Differential item functioning                                  #
##D #  A first example of a Multifaceted Rasch Model                            #
##D #  Facet is only female; 10 items are studied                               #
##D #############################################################################
##D data(data.ex08)
##D 
##D formulaA <- ~ item+female+item*female
##D # this formula is in R equivalent to 'item*female'
##D resp <- data.ex08[["resp"]]
##D facets <- as.data.frame( data.ex08[["facets"]] )
##D 
##D #***
##D # Model 8a: investigate gender DIF on all items
##D mod8a <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA )
##D summary(mod8a)
##D 
##D #***
##D # Model 8a 2: specification with long format response data
##D resp.long <- c( data.ex08[["resp"]] )
##D pid <- rep( 1:nrow(data.ex08[["resp"]]), ncol(data.ex08[["resp"]]) )
##D 
##D itemnames <- rep(colnames(data.ex08[["resp"]]), each=nrow(data.ex08[["resp"]]))
##D facets.long <- cbind( data.frame( "item"=itemnames ),
##D                  data.ex08[["facets"]][pid,,drop=F] )
##D 
##D mod8a_2 <- TAM::tam.mml.mfr( resp=resp.long, facets=facets.long,
##D                       formulaA=formulaA, pid=pid)
##D stopifnot( all(mod8a$xsi.facets$xsi==mod8a_2$xsi.facets$xsi) )
##D 
##D #***
##D # Model 8b: Differential bundle functioning (DBF)
##D #   - investigate differential item functioning in item groups
##D 
##D # modify pre-specified design matrix to define 'appropriate' DBF effects
##D formulaA <- ~ item*female
##D des <- TAM::designMatrices.mfr( resp=resp, facets=facets, formulaA=formulaA)
##D A1 <- des$A$A.3d
##D # item group A: items 1-5
##D # item group B: items 6-8
##D # item group C: items 9-10
##D A1 <- A1[,,1:13]
##D dimnames(A1)[[3]][ c(12,13) ] <- c("A:female1", "B:female1")
##D # item group A
##D A1[,2,12] <- 0
##D A1[c(1,5,7,9,11),2,12] <- -1
##D A1[c(1,5,7,9,11)+1,2,12] <- 1
##D # item group B
##D A1[,2,13] <- 0
##D A1[c(13,15,17),2,13] <- -1
##D A1[c(13,15,17)+1,2,13] <- 1
##D # item group C (define effect(A)+effect(B)+effect(C)=0)
##D A1[c(19,3),2,c(12,13)] <- 1
##D A1[c(19,3)+1,2,c(12,13)] <- -1
##D #   A1[,2,]   # look at modified design matrix
##D # estimate model
##D mod8b <- TAM::tam.mml( resp=des$gresp$gresp.noStep, A=A1 )
##D summary(mod8b)
##D 
##D #############################################################################
##D # EXAMPLE 9: Multifaceted Rasch Model
##D #############################################################################
##D 
##D data(data.sim.mfr)
##D data(data.sim.facets)
##D 
##D # two way interaction item and rater
##D formulaA <- ~item+item:step + item*rater
##D mod9a <- TAM::tam.mml.mfr( resp=data.sim.mfr, facets=data.sim.facets, formulaA=formulaA)
##D mod9a$xsi.facets
##D summary(mod9a)
##D 
##D # three way interaction item, female and rater
##D formulaA <- ~item+item:step + female*rater + female*item*step
##D mod9b <- TAM::tam.mml.mfr( resp=data.sim.mfr, facets=data.sim.facets, formulaA=formulaA)
##D summary(mod9b)
##D 
##D #############################################################################
##D # EXAMPLE 10: Model with raters.
##D #   Persons are arranged in multiple rows which is indicated
##D #   by multiple person identifiers.
##D #############################################################################
##D data(data.ex10)
##D dat <- data.ex10
##D head(dat)
##D   ##     pid rater I0001 I0002 I0003 I0004 I0005
##D   ## 1     1     1     0     1     1     0     0
##D   ## 451   1     2     1     1     1     1     0
##D   ## 901   1     3     1     1     1     0     1
##D   ## 452   2     2     1     1     1     0     1
##D   ## 902   2     3     1     1     0     1     1
##D 
##D facets <- dat[, "rater", drop=FALSE ] # define facet (rater)
##D pid <- dat$pid      # define person identifier (a person occurs multiple times)
##D resp <- dat[, -c(1:2) ]        # item response data
##D formulaA <- ~ item * rater      # formula
##D 
##D mod10 <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA, pid=dat$pid )
##D summary(mod10)
##D 
##D # estimate person parameter with WLE
##D wmod10 <- TAM::tam.wle( mod10 )
##D 
##D #--- Example 10a
##D # compare model containing only item
##D formulaA <- ~ item + rater      # pseudo formula for item
##D xsi.setnull <- "rater"          # set all rater effects to zero
##D mod10a <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA,
##D             xsi.setnull=xsi.setnull, pid=dat$pid, beta.fixed=cbind(1,1,0))
##D summary(mod10a)
##D 
##D # A shorter way for specifying this example is
##D formulaA <- ~ item + 0*rater        # set all rater effects to zero
##D mod10a1 <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA, pid=dat$pid )
##D summary(mod10a1)
##D 
##D # tam.mml.mfr also appropriately extends the facets data frame with pseudo facets
##D # if necessary
##D formulaA <- ~ item     # omitting the rater term
##D mod10a2 <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA, pid=dat$pid )
##D   ##   Item Parameters Xsi
##D   ##              xsi se.xsi
##D   ##   I0001   -1.931  0.111
##D   ##   I0002   -1.023  0.095
##D   ##   I0003   -0.089  0.089
##D   ##   I0004    1.015  0.094
##D   ##   I0005    1.918  0.110
##D   ##   psfPF11  0.000  0.000
##D   ##   psfPF12  0.000  0.000
##D 
##D #***
##D # Model 10_2: specification with long format response data
##D resp.long <- c(unlist( dat[, -c(1:2) ] ))
##D 
##D pid <- rep( dat$pid, ncol(dat[, -c(1:2) ]) )
##D itemnames <- rep(colnames(dat[, -c(1:2) ]), each=nrow(dat[, -c(1:2) ]))
##D 
##D # quick note: the 'trick' to use pid as the row index of the facet  (cf., used in Ex 8a_2)
##D # is not working here, since pid already occures multiple times in the original response data
##D facets <- cbind( data.frame("item"=itemnames),
##D                  dat[ rep(1:nrow(dat), ncol(dat[,-c(1:2)])), "rater",drop=F]
##D )
##D 
##D mod10_2 <- TAM::tam.mml.mfr( resp=resp.long, facets=facets, formulaA=formulaA, pid=pid)
##D 
##D stopifnot( all(mod10$xsi.facets$xsi==mod10_2$xsi.facets$xsi) )
##D 
##D #############################################################################
##D # EXAMPLE 11: Dichotomous data with missing and omitted responses
##D #############################################################################
##D data(data.ex11) ; dat <- data.ex11
##D 
##D #***
##D # Model 11a: Calibration (item parameter estimating) in which omitted
##D #            responses (code 9) are set to missing
##D dat1 <- dat[,-1]
##D dat1[ dat1==9 ] <- NA
##D # estimate Rasch model
##D mod11a <- TAM::tam.mml( resp=dat1 )
##D summary(mod11a)
##D # compute person parameters
##D wmod11a <- TAM::tam.wle( mod11a )
##D 
##D #***
##D # Model 11b: Scaling persons (WLE estimation) setting omitted
##D #            responses as incorrect and using fixed
##D #            item parameters form Model 11a
##D 
##D # set matrix with fixed item difficulties as the input
##D xsi1 <- mod11a$xsi    # xsi output from Model 11a
##D xsi.fixed <- cbind( seq(1,nrow(xsi1) ), xsi1$xsi )
##D # recode 9 to 0
##D dat2 <- dat[,-1]
##D dat2[ dat2==9 ] <- 0
##D # run Rasch model with fixed item difficulties
##D mod11b <- TAM::tam.mml( resp=dat2, xsi.fixed=xsi.fixed )
##D summary(mod11b)
##D # WLE estimation
##D wmod11b <- TAM::tam.wle( mod11b )
##D 
##D #############################################################################
##D # EXAMPLE 12: Avoiding nonconvergence using the argument increment.factor
##D #############################################################################
##D data(data.ex12)
##D dat <- data.ex12
##D 
##D # non-convergence without increment.factor
##D mod1 <- TAM::tam.mml.2pl( resp=data.ex12, control=list( maxiter=1000) )
##D 
##D # avoiding non-convergence with increment.factor=1.02
##D mod2 <- TAM::tam.mml.2pl( resp=data.ex12,
##D             control=list( maxiter=1000, increment.factor=1.02) )
##D summary(mod1)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 13: Longitudinal data 'data.long' from sirt package
##D #############################################################################
##D library(sirt)
##D data(data.long, package="sirt")
##D dat <- data.long
##D   ##   > colnames(dat)
##D   ##    [1] "idstud" "I1T1"   "I2T1"   "I3T1"   "I4T1"   "I5T1"   "I6T1"
##D   ##    [8] "I3T2"   "I4T2"   "I5T2"   "I6T2"   "I7T2"   "I8T2"
##D 
##D ## item 1 to 6 administered at T1 and items 3 to 8 at T2
##D ## items 3 to 6 are anchor items
##D 
##D #***
##D # Model 13a: 2-dimensional Rasch model assuming invariant item difficulties
##D 
##D # define matrix loadings
##D Q <- matrix(0,12,2)
##D colnames(Q) <- c("T1","T2")
##D Q[1:6,1] <- 1       # items at T1
##D Q[7:12,2] <- 1      # items at T2
##D 
##D # assume equal item difficulty of I3T1 and I3T2, I4T1 and I4T2, ...
##D # create draft design matrix and modify it
##D A <- TAM::designMatrices(resp=data.long[,-1])$A
##D dimnames(A)[[1]] <- colnames(data.long)[-1]
##D   ##   > str(A)
##D   ##    num [1:12, 1:2, 1:12] 0 0 0 0 0 0 0 0 0 0 ...
##D   ##    - attr(*, "dimnames")=List of 3
##D   ##     ..$ : chr [1:12] "Item01" "Item02" "Item03" "Item04" ...
##D   ##     ..$ : chr [1:2] "Category0" "Category1"
##D   ##     ..$ : chr [1:12] "I1T1" "I2T1" "I3T1" "I4T1" ...
##D A1 <- A[,, c(1:6, 11:12 ) ]
##D dimnames(A1)[[3]] <- substring( dimnames(A1)[[3]],1,2)
##D A1[7,2,3] <- -1     # difficulty(I3T1)=difficulty(I3T2)
##D A1[8,2,4] <- -1     # I4T1=I4T2
##D A1[9,2,5] <- A1[10,2,6] <- -1
##D   ##   > A1[,2,]
##D   ##        I1 I2 I3 I4 I5 I6 I7 I8
##D   ##   I1T1 -1  0  0  0  0  0  0  0
##D   ##   I2T1  0 -1  0  0  0  0  0  0
##D   ##   I3T1  0  0 -1  0  0  0  0  0
##D   ##   I4T1  0  0  0 -1  0  0  0  0
##D   ##   I5T1  0  0  0  0 -1  0  0  0
##D   ##   I6T1  0  0  0  0  0 -1  0  0
##D   ##   I3T2  0  0 -1  0  0  0  0  0
##D   ##   I4T2  0  0  0 -1  0  0  0  0
##D   ##   I5T2  0  0  0  0 -1  0  0  0
##D   ##   I6T2  0  0  0  0  0 -1  0  0
##D   ##   I7T2  0  0  0  0  0  0 -1  0
##D   ##   I8T2  0  0  0  0  0  0  0 -1
##D 
##D # estimate model
##D # set intercept of second dimension (T2) to zero
##D beta.fixed <- cbind( 1, 2, 0 )
##D mod13a <- TAM::tam.mml( resp=data.long[,-1], Q=Q, A=A1, beta.fixed=beta.fixed)
##D summary(mod13a)
##D 
##D #--- tamaan specification
##D tammodel <- "
##D   LAVAAN MODEL:
##D     T1=~ 1*I1T1__I6T1
##D     T2=~ 1*I3T2__I8T2
##D     T1 ~~ T1
##D     T2 ~~ T2
##D     T1 ~~ T2
##D     # constraint on item difficulties
##D     I3T1 + I3T2 | b3*t1
##D     I4T1 + I4T2 | b4*t1
##D     I5T1 + I5T2 | b5*t1
##D     I6T1 + I6T2 | b6*t1
##D     "
##D # The constraint on item difficulties can be more efficiently written as
##D   ##       DO(3,6,1)
##D   ##         I%T1 + I%T2 | b%*t1
##D   ##       DOEND
##D # estimate model
##D mod13at <- TAM::tamaan( tammodel, resp=data.long,  beta.fixed=beta.fixed )
##D summary(mod13at)
##D 
##D #***
##D # Model 13b: invariant item difficulties with zero mean item difficulty
##D #           of anchor items
##D 
##D A <- TAM::designMatrices(resp=data.long[,-1])$A
##D dimnames(A)[[1]] <- colnames(data.long)[-1]
##D A1 <- A[,, c(1:5, 11:12 ) ]
##D dimnames(A1)[[3]] <- substring( dimnames(A1)[[3]],1,2)
##D A1[7,2,3] <- -1     # difficulty(I3T1)=difficulty(I3T2)
##D A1[8,2,4] <- -1     # I4T1=I4T2
##D A1[9,2,5] <- -1
##D A1[6,2,3] <- A1[6,2,4] <- A1[6,2,5] <- 1     # I6T1=-(I3T1+I4T1+I5T1)
##D A1[10,2,3] <- A1[10,2,4] <- A1[10,2,5] <- 1  # I6T2=-(I3T2+I4T2+I5T2)
##D A1[,2,]
##D   ##      I1 I2 I3 I4 I5 I7 I8
##D   ## I1T1 -1  0  0  0  0  0  0
##D   ## I2T1  0 -1  0  0  0  0  0
##D   ## I3T1  0  0 -1  0  0  0  0
##D   ## I4T1  0  0  0 -1  0  0  0
##D   ## I5T1  0  0  0  0 -1  0  0
##D   ## I6T1  0  0  1  1  1  0  0
##D   ## I3T2  0  0 -1  0  0  0  0
##D   ## I4T2  0  0  0 -1  0  0  0
##D   ## I5T2  0  0  0  0 -1  0  0
##D   ## I6T2  0  0  1  1  1  0  0
##D   ## I7T2  0  0  0  0  0 -1  0
##D   ## I8T2  0  0  0  0  0  0 -1
##D 
##D mod13b <- TAM::tam.mml( resp=data.long[,-1], Q=Q, A=A1, beta.fixed=FALSE)
##D summary(mod13b)
##D 
##D #***
##D # Model 13c: longitudinal polytomous data
##D #
##D 
##D # modifiy Items I1T1, I4T1, I4T2 in order to be trichotomous (codes: 0,1,2)
##D set.seed(42)
##D dat <- data.long
##D dat[(1:50),2] <- sample(c(0,1,2), 50, replace=TRUE)
##D dat[(1:50),5] <- sample(c(0,1,2), 50, replace=TRUE)
##D dat[(1:50),9] <- sample(c(0,1,2), 50, replace=TRUE)
##D   ##   > colnames(dat)
##D   ##    [1] "idstud" "I1T1"   "I2T1"   "I3T1"   "I4T1"   "I5T1"   "I6T1"
##D   ##    [8] "I3T2"   "I4T2"   "I5T2"   "I6T2"   "I7T2"   "I8T2"
##D 
##D ## item 1 to 6 administered at T1, items 3 to 8 at T2
##D ## items 3 to 6 are anchor items
##D 
##D # (1) define matrix loadings
##D Q <- matrix(0,12,2)
##D colnames(Q) <- c("T1","T2")
##D Q[1:6,1] <- 1       # items at T1
##D Q[7:12,2] <- 1      # items at T2
##D 
##D # (2) assume equal item difficulty of anchor items
##D #     create draft design matrix and modify it
##D A <- TAM::designMatrices(resp=dat[,-1])$A
##D dimnames(A)[[1]] <- colnames(dat)[-1]
##D   ## > str(A)
##D   ## num [1:12, 1:3, 1:15] 0 0 0 0 0 0 0 0 0 0 ...
##D   ## - attr(*, "dimnames")=List of 3
##D   ## ..$ : chr [1:12] "I1T1" "I2T1" "I3T1" "I4T1" ...
##D   ## ..$ : chr [1:3] "Category0" "Category1" "Category2"
##D   ## ..$ : chr [1:15] "I1T1_Cat1" "I1T1_Cat2" "I2T1_Cat1" "I3T1_Cat1" ...
##D 
##D # define matrix A
##D # Items 1 to 3 administered at T1, Items 3 to 6 are anchor items
##D # Item 7 to 8 administered at T2
##D # Item I1T1, I4T1, I4T2 are trichotomous (codes: 0,1,2)
##D A1 <- A[,, c(1:8, 14:15) ]
##D dimnames(A1)[[3]] <- gsub("T1|T2", "",  dimnames(A1)[[3]])
##D 
##D # Modifications are shortened compared to Model 13 a, but are still valid
##D A1[7,,] <- A1[3,,]  # item 7, i.e. I3T2, loads on same parameters as
##D                     # item 3, I3T1
##D A1[8,,] <- A1[4,,]  # same for item 8 and item 4
##D A1[9,,] <- A1[5,,]  # same for item 9 and item 5
##D A1[10,,] <- A1[6,,] # same for item 10 and item 6
##D   ## > A1[8,,]
##D   ##           I1_Cat1 I1_Cat2 I2_Cat1 I3_Cat1 I4_Cat1 I4_Cat2 I5_Cat1 ...
##D   ## Category0       0       0       0       0       0       0       0
##D   ## Category1       0       0       0       0      -1       0       0
##D   ## Category2       0       0       0       0      -1      -1       0
##D 
##D # (3) estimate model
##D #     set intercept of second dimension (T2) to zero
##D beta.fixed <- cbind( 1, 2, 0 )
##D mod13c <- TAM::tam.mml( resp=dat[,-1], Q=Q, A=A1, beta.fixed=beta.fixed,
##D                    irtmodel="PCM")
##D summary(mod13c)
##D wle.mod13c <- TAM::tam.wle(mod13c) # WLEs of dimension T1 and T2
##D 
##D #############################################################################
##D # EXAMPLE 14: Facet model with latent regression
##D #############################################################################
##D data( data.ex14 )
##D dat <- data.ex14
##D 
##D #***
##D # Model 14a: facet model
##D resp <- dat[, paste0("crit",1:7,sep="") ]    # item data
##D facets <- data.frame( "rater"=dat$rater )     # define facets
##D formulaA <- ~item+item*step + rater
##D mod14a <- TAM::tam.mml.mfr( resp, facets=facets, formulaA=formulaA, pid=dat$pid )
##D summary(mod14a)
##D 
##D #***
##D # Model 14b: facet model with latent regression
##D #   Note that dataY must correspond to rows in resp and facets which means
##D #   that there must be the same rows in Y for a person with multiple rows
##D #   in resp
##D dataY <- dat[, c("X1","X2") ]        # latent regressors
##D formulaY <- ~ X1+X2            # latent regression formula
##D mod14b <- TAM::tam.mml.mfr( resp, facets=facets, formulaA=formulaA,
##D             dataY=dataY, formulaY=formulaY, pid=dat$pid)
##D summary(mod14b)
##D 
##D #***
##D # Model 14c: Multi-facet model with item slope estimation
##D # use design matrix and modified response data from Model 1
##D # item-specific slopes
##D 
##D resp1 <- mod14a$resp      # extract response data with generalized items
##D A <- mod14a$A             # extract design matrix for item intercepts
##D colnames(resp1)
##D 
##D # define design matrix for slopes
##D E <- matrix( 0, nrow=ncol(resp1), ncol=7 )
##D colnames(E) <- paste0("crit",1:7)
##D rownames(E) <- colnames(resp1)
##D E[ cbind( 1:(7*7), rep(1:7,each=7) ) ] <- 1
##D 
##D mod14c <- TAM::tam.mml.2pl( resp=resp1, A=A, irtmodel="GPCM.design", E=E,
##D         control=list(maxiter=100) )
##D summary(mod14c)
##D 
##D #############################################################################
##D # EXAMPLE 15: Coping with nonconvergent models
##D #############################################################################
##D 
##D data(data.ex15)
##D data <- data.ex15
##D # facet model 'group*item' is of interest
##D 
##D #***
##D # Model 15a:
##D mod15a <- TAM::tam.mml.mfr(resp=data[,-c(1:2)],facets=data[,"group",drop=FALSE],
##D     formulaA=~ item + group*item, pid=data$pid )
##D # See output:
##D   ##
##D   ##   Iteration 47     2013-09-10 16:51:39
##D   ##   E Step
##D   ##   M Step Intercepts   |----
##D   ##     Deviance=75510.2868 | Deviance change: -595.0609
##D   ##   !!! Deviance increases!                                        !!!!
##D   ##   !!! Choose maybe fac.oldxsi > 0 and/or increment.factor > 1    !!!!
##D   ##     Maximum intercept parameter change: 0.925045
##D   ##     Maximum regression parameter change: 0
##D   ##     Variance:  0.9796  | Maximum change: 0.009226
##D 
##D #***
##D # Model 15b: Follow the suggestions of changing the default of fac.oldxsi and
##D #            increment.factor
##D mod15b <- TAM::tam.mml.mfr(resp=data[,-c(1:2)],facets=data[,"group",drop=FALSE],
##D             formulaA=~ group*item, pid=data$pid,
##D             control=list( increment.factor=1.03, fac.oldxsi=.4 ) )
##D 
##D #***
##D # Model 15c: Alternatively, just choose more iterations in M-step by "Msteps=10"
##D mod15c <- TAM::tam.mml.mfr(resp=data[,-c(1:2)],facets=data[,"group",drop=FALSE],
##D     formulaA=~ item + group*item, pid=data$pid,
##D     control=list(maxiter=250, Msteps=10))
##D 
##D #############################################################################
##D # EXAMPLE 16: Differential item function for polytomous items and
##D #             differing number of response options per item
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored
##D # extract item response data
##D resp <- dat[, sort(grep("M", colnames(data.timssAusTwn.scored), value=TRUE)) ]
##D # some descriptives
##D psych::describe(resp)
##D # define facets: 'cnt' is group identifier
##D facets <- data.frame( "cnt"=dat$IDCNTRY)
##D # create design matrices
##D des2 <- TAM::designMatrices.mfr2( resp=resp, facets=facets,
##D                    formulaA=~item*step + item*cnt)
##D # restructured data set: pseudoitem=item x country
##D resp2 <- des2$gresp$gresp.noStep
##D # A design matrix
##D A <- des2$A$A.3d
##D     # redundant xsi parameters must be eliminated from design matrix
##D xsi.elim <- des2$xsi.elim
##D A <- A[,, - xsi.elim[,2] ]
##D # extract loading matrix B
##D B <- des2$B$B.3d
##D # estimate model
##D mod1 <- TAM::tam.mml( resp=resp2, A=A, B=B, control=list(maxiter=100) )
##D summary(mod1)
##D # The sum of all DIF parameters is set to zero. The DIF parameter for the last
##D # item is therefore obtained
##D xsi1 <- mod1$xsi
##D difxsi <- xsi1[ intersect( grep("cnt",rownames(xsi1)),
##D               grep("M03",rownames(xsi1))), ]   - colSums(difxsi)
##D     # this is the DIF effect of the remaining item
##D 
##D #############################################################################
##D # EXAMPLE 17: Several multidimensional and subdimension models
##D #############################################################################
##D 
##D library(mirt)
##D #*** (1) simulate data in mirt package
##D set.seed(9897)
##D # simulate data according to the four-dimensional Rasch model
##D # variances
##D variances <- c( 1.45, 1.74, .86, 1.48  )
##D # correlations
##D corrs <- matrix( 1, 4, 4 )
##D dd1 <- 1 ; dd2 <- 2 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .88
##D dd1 <- 1 ; dd2 <- 3 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .85
##D dd1 <- 1 ; dd2 <- 4 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .87
##D dd1 <- 2 ; dd2 <- 3 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .84
##D dd1 <- 2 ; dd2 <- 4 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .90
##D dd1 <- 3 ; dd2 <- 4 ; corrs[dd1,dd2] <- corrs[dd2,dd1] <- .90
##D # covariance matrix
##D covar <- outer( sqrt( variances), sqrt(variances) )*corrs
##D # item thresholds and item discriminations
##D d <- matrix( stats::runif(40, -2, 2 ), ncol=1 )
##D a <- matrix(NA, nrow=40,ncol=4)
##D a[1:10,1] <- a[11:20,2] <- a[21:30,3] <- a[31:40,4] <- 1
##D # simulate data
##D dat <- mirt::simdata(a=a, d=d, N=1000, itemtype="dich", sigma=covar )
##D # define Q-matrix for testlet and subdimension models estimated below
##D Q <- matrix( 0, nrow=40, ncol=5 )
##D colnames(Q) <- c("g", paste0( "subd", 1:4) )
##D Q[,1] <- 1
##D Q[1:10,2] <- Q[11:20,3] <- Q[21:30,4] <- Q[31:40,5] <- 1
##D 
##D # define maximum number of iterations and number of quasi monte carlo nodes
##D # maxit <- 5  ; snodes <- 300    # this specification is only for speed reasons
##D maxit <- 200 ; snodes <- 1500
##D 
##D #*****************
##D # Model 1: Rasch testlet model
##D #*****************
##D 
##D # define a user function for restricting the variance according to the
##D # Rasch testlet model
##D variance.fct1 <- function( variance ){
##D             ndim <- ncol(variance)
##D             variance.new <- matrix( 0, ndim, ndim )
##D             diag(variance.new) <- diag(variance)
##D             variance <- variance.new
##D             return(variance)
##D                     }
##D variance.Npars <- 5    # number of estimated parameters in variance matrix
##D # estimation using tam.mml
##D mod1 <- TAM::tam.mml( dat, Q=Q, userfct.variance=variance.fct1,
##D              variance.Npars=variance.Npars, control=list(maxiter=maxit, QMC=TRUE,
##D                           snodes=snodes))
##D summary(mod1)
##D 
##D #*****************
##D # Model 2: Testlet model with correlated testlet effects
##D #*****************
##D 
##D # specify a testlet model with general factor g and testlet effects
##D # u_1,u_2,u_3 and u_4. Assume that Cov(g,u_t)=0 for all t=1,2,3,4.
##D # Additionally, assume that \sum_t,t' Cov( u_t, u_t')=0, i.e.
##D # the sum of all testlet covariances is equal to zero
##D #=> testlet effects are uncorrelated on average.
##D 
##D # set Cov(g,u_t)=0 and sum of all testlet covariances equals to zero
##D variance.fct2 <- function( variance ){
##D             ndim <- ncol(variance)
##D             variance.new <- matrix( 0, ndim, ndim )
##D             diag(variance.new) <- diag(variance)
##D             variance.new[1,2:ndim] <- variance.new[2:ndim,1] <- 0
##D             # calculate average covariance between testlets
##D             v1 <- variance[ -1, -1] - variance.new[-1,-1]
##D             M1 <- sum(v1) / ( ( ndim-1)^2 - ( ndim - 1))
##D             v1 <- v1 - M1
##D             variance.new[ -1, -1 ] <- v1
##D             diag(variance.new) <- diag(variance)
##D             variance <- variance.new
##D             return(variance)
##D                     }
##D variance.Npars <- 1 + 4 + (4*3)/2 - 1
##D # estimate model in TAM
##D mod2 <- TAM::tam.mml( dat, Q=Q, userfct.variance=variance.fct2,
##D                 variance.Npars=variance.Npars,
##D                 control=list(maxiter=maxit, QMC=TRUE, snodes=snodes) )
##D summary(mod2)
##D 
##D #*****************
##D # Model 3: Testlet model with correlated testlet effects (different identification)
##D #*****************
##D 
##D # Testlet model like in Model 2. But now the constraint is
##D # \sum _t,t' Cov(u_t, u_t') + \sum_t Var(u_t)=0, i.e.
##D # the sum of all testlet covariances and variances is equal to zero.
##D variance.fct3 <- function( variance ){
##D             ndim <- ncol(variance)
##D             variance.new <- matrix( 0, ndim, ndim )
##D             diag(variance.new) <- diag(variance)
##D             variance.new[1,2:ndim] <- variance.new[2:ndim,1] <- 0
##D             # calculate average covariance and variance between testlets
##D             v1 <- variance[ -1, -1]
##D             M1 <- mean(v1)
##D             v1 <- v1 - M1
##D             variance.new[ -1, -1 ] <- v1
##D             # ensure positive definiteness of covariance matrix
##D             eps <- 10^(-2)
##D             diag(variance.new) <- diag( variance.new) + eps
##D             variance.new <- psych::cor.smooth( variance.new )  # smoothing in psych
##D             variance <- variance.new
##D             return(variance)
##D                     }
##D variance.Npars <- 1 + 4 + (4*3)/2 - 1
##D # estimate model in TAM
##D mod3 <- TAM::tam.mml( dat, Q=Q, userfct.variance=variance.fct3,
##D                 variance.Npars=variance.Npars,
##D                 control=list(maxiter=maxit, QMC=TRUE, snodes=snodes) )
##D summary(mod3)
##D 
##D #*****************
##D # Model 4: Rasch subdimension model
##D #*****************
##D 
##D # The Rasch subdimension model is specified according to Brandt (2008).
##D # The fourth testlet effect is defined as u4=- (u1+u2+u3)
##D # specify an alternative Q-matrix with 4 dimensions
##D Q2 <- Q[,-5]
##D Q2[31:40,2:4] <- -1
##D 
##D # set Cov(g,u1)=Cov(g,u2)=Cov(g,u3)=0
##D variance.fixed <- rbind( c(1,2,0), c(1,3,0), c(1,4,0) )
##D # estimate model in TAM
##D mod4 <- TAM::tam.mml( dat, Q=Q2,variance.fixed=variance.fixed,
##D                 control=list(maxiter=maxit, QMC=TRUE, snodes=snodes) )
##D summary(mod4)
##D 
##D #*****************
##D # Model 5: Higher-order model
##D #*****************
##D 
##D # A four-dimensional model with a higher-order factor is specified.
##D # F_t=a_t g + eps_g
##D Q3 <- Q[,-1]
##D # define fitting function using the lavaan package and ULS estimation
##D N0 <- nrow(dat)         # sample size of dataset
##D library(lavaan)        # requires lavaan package for fitting covariance
##D variance.fct5 <- function( variance ){
##D     ndim <- ncol(variance)
##D     rownames(variance) <- colnames(variance) <- paste0("F",1:ndim)
##D     lavmodel <- paste0(
##D         "FHO=~", paste0( paste0( "F", 1:ndim ), collapse="+" ) )
##D     lavres <- lavaan::cfa( model=lavmodel, sample.cov=variance, estimator="ULS",
##D                        std.lv=TRUE, sample.nobs=N0)
##D     variance.new <- fitted(lavres)$cov
##D     variance <- variance.new
##D     # print coefficients
##D     cat( paste0( "\n **** Higher order loadings: ",
##D             paste0( paste0( round( coef(lavres)[ 1:ndim ], 3 )), collapse=" ")
##D                         ), "\n")
##D     return(variance)
##D                     }
##D variance.Npars <- 4+4
##D # estimate model in TAM
##D mod5 <- TAM::tam.mml( dat, Q=Q3, userfct.variance=variance.fct5,
##D                 variance.Npars=variance.Npars,
##D                 control=list(maxiter=maxit, QMC=TRUE, snodes=snodes) )
##D summary(mod5)
##D 
##D #*****************
##D # Model 6: Generalized Rasch subdimension model (Brandt, 2012)
##D #*****************
##D 
##D Q2 <- Q[,-5]
##D Q2[31:40,2:4] <- -1
##D # fixed covariances
##D variance.fixed2 <- rbind( c(1,2,0), c(1,3,0), c(1,4,0)  )
##D # design matrix for item loading parameters
##D #      items x category x dimension x xsi parameter
##D E <- array( 0, dim=c( 40, 2, 4, 4 ) )
##D E[ 1:10, 2, c(1,2), 1 ] <- 1
##D E[ 11:20, 2, c(1,3), 2 ] <- 1
##D E[ 21:30, 2, c(1,4), 3 ] <- 1
##D E[ 31:40, 2, 1, 4 ] <- 1
##D E[ 31:40, 2, 2:4, 4 ] <- -1
##D 
##D # constraint on slope parameters, see Brandt (2012)
##D gammaconstr <- function( gammaslope ){
##D         K <- length( gammaslope)
##D         g1 <- sum( gammaslope^2  )
##D         gammaslope.new <- sqrt(K) / sqrt(g1) * gammaslope
##D         return(gammaslope.new)
##D                     }
##D # estimate model
##D mod6 <- TAM::tam.mml.3pl( dat, E=E, Q=Q2, variance.fixed=variance.fixed2,
##D            skillspace="normal", userfct.gammaslope=gammaconstr, gammaslope.constr.Npars=1,
##D            control=list(maxiter=maxit, QMC=TRUE, snodes=snodes ) )
##D summary(mod6)
##D 
##D #############################################################################
##D # EXAMPLE 18: Partial credit model with dimension-specific sum constraints
##D #             on item difficulties
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students[, c( paste0("sc",1:4), paste0("mj",1:4) ) ]
##D # specify dimensions in Q-matrix
##D Q <- matrix( 0,  nrow=8, ncol=2 )
##D Q[1:4,1] <- Q[5:8,2] <- 1
##D # partial credit model with some constraint on item parameters
##D mod1 <- TAM::tam.mml( dat, Q=Q, irtmodel="PCM2", constraint="items")
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 19: Partial credit scoring: 0.5 points for partial credit items
##D #             and 1 point for dichotomous items
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored
##D # extrcat item response data
##D dat <- dat[, grep("M03", colnames(dat) ) ]
##D 
##D # select items with do have maximum score of 2 (polytomous items)
##D ind <- which( apply( dat,  2, max, na.rm=TRUE )==2 )
##D I <- ncol(dat)
##D # define Q-matrix with scoring variant
##D Q <- matrix( 1, nrow=I, ncol=1 )
##D Q[ ind, 1 ] <- .5    # score of 0.5 for polyomous items
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml( dat, Q=Q, irtmodel="PCM2", control=list(nodes=seq(-10,10,len=21)))
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 20: Specification of loading matrix in multidimensional model
##D #############################################################################
##D 
##D data(data.gpcm)
##D psych::describe(data.gpcm)
##D resp <- data.gpcm
##D 
##D # define three dimensions and different loadings of item categories
##D # on these dimensions in B loading matrix
##D I <- 3  # 3 items
##D D <- 3  # 3 dimensions
##D # define loading matrix B
##D # 4 categories for each item (0,1,2,3)
##D B <- array( 0, dim=c(I,4,D) )
##D for (ii in 1:I){
##D     B[ ii, 1:4, 1 ] <- 0:3
##D     B[ ii, 1,2 ] <- 1
##D     B[ ii, 4,3 ] <- 1
##D             }
##D dimnames(B)[[1]] <- colnames(resp)
##D B[1,,]
##D   ##   > B[1,,]
##D   ##        [,1] [,2] [,3]
##D   ##   [1,]    0    1    0
##D   ##   [2,]    1    0    0
##D   ##   [3,]    2    0    0
##D   ##   [4,]    3    0    1
##D #-- test run
##D mod1 <- TAM::tam.mml( resp, B=B, control=list( snodes=1000, maxiter=5)  )
##D summary(mod1)
##D 
##D # Same model with TAM::tam.mml.3pl instead
##D 
##D dim4 <- sum(apply(B, c(1, 3), function(x) any(!(x==0))))
##D E1 <- array(0, dim=c(dim(B), dim4))
##D 
##D kkk <- 0
##D for (iii in seq_len(dim(E1)[1])) {
##D     for (jjj in seq_len(dim(E1)[3])) {
##D         if (any(B[iii,, jjj] !=0)) {
##D             kkk <- kkk + 1
##D             E1[iii,, jjj, kkk] <- B[iii,, jjj]
##D         }
##D     }
##D }
##D if (kkk !=dim4) stop("Something went wrong in the loop, because 'kkk !=dim4'.")
##D 
##D mod2 <- TAM::tam.mml.3pl(resp, E=E1, est.some.slopes=FALSE, control=list(maxiter=50))
##D summary(mod2)
##D 
##D cor(mod1$person$EAP.Dim3, mod2$person$EAP.Dim3)
##D cor(mod1$person$EAP.Dim2, mod2$person$EAP.Dim2)
##D cor(mod1$person$EAP.Dim1, mod2$person$EAP.Dim1)
##D cor(mod1$xsi$xsi, mod2$xsi$xsi)
##D 
##D #############################################################################
##D # EXAMPLE 21: Acceleration of EM algorithm | dichotomous data
##D #############################################################################
##D 
##D N <- 1000      # number of persons
##D I <- 100       # number of items
##D set.seed(987)
##D # simulate data according to the Rasch model
##D dat <- sirt::sim.raschtype( rnorm(N), b=seq(-2,2,len=I)  )
##D # estimate models
##D mod1n <- TAM::tam.mml( resp=dat, control=list( acceleration="none") )  # no acceler.
##D mod1y <- TAM::tam.mml( resp=dat, control=list( acceleration="Yu") )  # Yu acceler.
##D mod1r <- TAM::tam.mml( resp=dat, control=list( acceleration="Ramsay") )  # Ramsay acceler.
##D # compare number of iterations
##D mod1n$iter ; mod1y$iter ; mod1r$iter
##D # log-likelihood values
##D logLik(mod1n); logLik(mod1y) ; logLik(mod1r)
##D 
##D #############################################################################
##D # EXAMPLE 22: Acceleration of EM algorithm | polytomous data
##D #############################################################################
##D 
##D data(data.gpcm)
##D dat <- data.gpcm
##D 
##D # no acceleration
##D mod1n <- TAM::tam.mml.2pl( resp=dat, irtmodel="GPCM",
##D                 control=list( conv=1E-4, acceleration="none") )
##D # Yu acceleration
##D mod1y <- TAM::tam.mml.2pl( resp=dat, irtmodel="GPCM",
##D                 control=list( conv=1E-4, acceleration="Yu") )
##D # Ramsay acceleration
##D mod1r <- TAM::tam.mml.2pl( resp=dat, irtmodel="GPCM",
##D                 control=list( conv=1E-4, acceleration="Ramsay") )
##D # number of iterations
##D mod1n$iter ; mod1y$iter ; mod1r$iter
##D 
##D #############################################################################
##D # EXAMPLE 23: Multidimensional polytomous Rasch model in which
##D #             dimensions are defined by categories
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students[, grep( "act", colnames(data.Students) ) ]
##D 
##D # define multidimensional model in which categories of item define dimensions
##D 
##D # * Category 0 -> loading of one on Dimension 0
##D # * Category 1 -> no loadings
##D # * Category 2 -> loading of one on Dimension 2
##D 
##D # extract default design matrices
##D res <- TAM::designMatrices( resp=dat )
##D A <- res$A
##D B0 <- 0*res$B
##D # create design matrix B
##D B <- array( 0, dim=c( dim(B0)[c(1,2) ], 2  ) )
##D dimnames(B)[[1]] <- dimnames(B0)[[1]]
##D dimnames(B)[[2]] <- dimnames(B0)[[2]]
##D dimnames(B)[[3]] <- c( "Dim0", "Dim2" )
##D B[,1,1]  <- 1
##D B[,3,2]  <- 1
##D 
##D # estimate multdimensional Rasch model
##D mod1 <- TAM::tam.mml( resp=dat, A=A, B=B, control=list( maxiter=100) )
##D summary(mod1)
##D 
##D # alternative definition of B
##D # * Category 1: negative loading on Dimension 1 and Dimension 2
##D B <- array( 0, dim=c( dim(B0)[c(1,2) ], 2  ) )
##D dimnames(B)[[1]] <- dimnames(B0)[[1]]
##D dimnames(B)[[2]] <- dimnames(B0)[[2]]
##D dimnames(B)[[3]] <- c( "Dim0", "Dim2" )
##D B[,1, 1]  <- 1
##D B[,3, 2]  <- 1
##D B[,2, c(1,2)]  <- -1
##D 
##D # estimate model
##D mod2 <- TAM::tam.mml( resp=dat, A=A, B=B, control=list( maxiter=100) )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 24: Sum constraint on item-category parameters in partial credit model
##D #############################################################################
##D 
##D data(data.gpcm,package="TAM")
##D dat <- data.gpcm
##D 
##D # check number of categories
##D c1 <- TAM::tam.ctt3(dat)
##D 
##D #--- fit with PCM
##D mod1 <- TAM::tam.mml( dat )
##D summary(mod1, file="mod1")
##D 
##D #--- fit with constraint on sum of categories
##D #** redefine design matrix
##D A1 <- 0*mod1$A
##D A1 <- A1[,, - dim(A1)[[3]]]
##D str(A1)
##D NP <- dim(A1)[[3]]
##D # define item category parameters
##D A1[1,2,1] <- A1[1,3,2] <- A1[1,4,3] <- -1
##D A1[2,2,4] <- A1[2,3,5] <- A1[2,4,6] <- -1
##D A1[3,2,7] <- A1[3,3,8] <- -1
##D A1[3,4,1:8] <- 1
##D # check definition
##D A1[1,,]
##D A1[2,,]
##D A1[3,,]
##D 
##D #** estimate model
##D mod2 <- TAM::tam.mml( dat, A=A1, beta.fixed=FALSE)
##D summary(mod2, file="mod2")
##D 
##D #--- compare model fit
##D IRT.compareModels(mod1, mod2 )  # -> equivalent model fit
##D 
##D #############################################################################
##D # EXAMPLE 25: Different GPCM parametrizations in IRT packages
##D #############################################################################
##D 
##D library(TAM)
##D library(mirt)
##D library(ltm)
##D 
##D data(data.gpcm, package="TAM")
##D dat <- data.gpcm
##D 
##D #*** TAM
##D mod1 <- TAM::tam.mml.2pl(dat, irtmodel="GPCM")
##D #*** mirt
##D mod2 <- mirt::mirt(dat, 1, itemtype="gpcm", verbose=TRUE)
##D #*** ltm
##D mod3 <- ltm::gpcm( dat, control=list(verbose=TRUE) )
##D mod3b <- ltm::gpcm( dat, control=list(verbose=TRUE), IRT.param=FALSE)
##D 
##D #-- comparison log likelihood
##D logLik(mod1)
##D logLik(mod2)
##D logLik(mod3)
##D logLik(mod3b)
##D 
##D #*** intercept parametrization (like in TAM)
##D 
##D # TAM
##D mod1$B[,2,1]   # slope
##D mod1$AXsi      # intercepts
##D # mirt
##D coef(mod2)
##D # ltm
##D coef(mod3b, IRT.param=FALSE)[, c(4,1:3)]
##D 
##D #*** IRT parametrization
##D 
##D # TAM
##D mod1$AXsi / mod1$B[,2,1]
##D # mirt
##D coef(mod2, IRTpars=TRUE)
##D # ltm
##D coef(mod3)[, c(4,1:3)]
## End(Not run)



