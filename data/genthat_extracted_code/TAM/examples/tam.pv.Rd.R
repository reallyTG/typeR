library(TAM)


### Name: tam.pv
### Title: Plausible Value Imputation
### Aliases: tam.pv tam.pv.mcmc summary.tam.pv.mcmc plot.tam.pv.mcmc
### Keywords: Plausible value imputation

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous unidimensional data sim.rasch
#############################################################################

data(data.sim.rasch)
resp <- data.sim.rasch[ 1:500, 1:15 ]  # select subsample of students and items

# estimate Rasch model
mod <- TAM::tam.mml(resp)

# draw 5 plausible values without a normality
# assumption of the posterior and 2000 ability nodes
pv1a <- TAM::tam.pv( mod, nplausible=5, ntheta=2000 )

# draw 5 plausible values with a normality
# assumption of the posterior and 500 ability nodes
pv1b <- TAM::tam.pv( mod, nplausible=5, ntheta=500, normal.approx=TRUE )

# distribution of first plausible value from imputation pv1
hist(pv1a$pv$PV1.Dim1 )
# boxplot of all plausible values from imputation pv2
boxplot(pv1b$pv[, 2:6 ] )

## Not run: 
##D # draw plausible values with tam.pv.mcmc function
##D Y <- matrix(1, nrow=500, ncol=1)
##D pv2 <- TAM::tam.pv.mcmc( tamobj=mod, Y=Y, nplausible=5 )
##D str(pv2)
##D 
##D # summary output
##D summary(pv2)
##D # assessing convergence with traceplots
##D plot(pv2, ask=TRUE)
##D 
##D # use starting values for theta and MH factors which fulfill acceptance rates
##D # from previously fitted model
##D pv3 <- TAM::tam.pv.mcmc( tamobj=mod, Y=Y, nplausible=5, theta_init=pv2$theta_last,
##D             adj_MH=pv2$theta_acceptance_MH$adj_MH )
##D 
##D #############################################################################
##D # EXAMPLE 2: Unidimensional plausible value imputation with
##D #            background variables; dataset data.pisaRead from sirt package
##D #############################################################################
##D 
##D data(data.pisaRead, package="sirt")
##D dat <- data.pisaRead$data
##D   ##   > colnames(dat)
##D   ##    [1] "idstud"   "idschool" "female"   "hisei"    "migra"    "R432Q01"
##D   ##    [7] "R432Q05"  "R432Q06"  "R456Q01"  "R456Q02"  "R456Q06"  "R460Q01"
##D   ##   [13] "R460Q05"  "R460Q06"  "R466Q02"  "R466Q03"  "R466Q06"
##D 
##D ## Note that reading items have variable names starting with R4
##D 
##D # estimate 2PL model without covariates
##D items <- grep("R4", colnames(dat) )    # select test items from data
##D mod2a <- TAM::tam.mml.2pl( resp=dat[,items] )
##D summary(mod2a)
##D 
##D # fix item parameters for plausible value imputation
##D    # fix item intercepts by defining xsi.fixed
##D xsi0 <- mod2a$xsi$xsi
##D xsi.fixed <- cbind( seq(1,length(xsi0)), xsi0 )
##D    # fix item slopes using mod2$B
##D # matrix of latent regressors female, hisei and migra
##D Y <- dat[, c("female", "hisei", "migra") ]
##D mod2b <- TAM::tam.mml( resp=dat[,items], B=mod2a$B, xsi.fixed=xsi.fixed, Y=Y,
##D             pid=dat$idstud)
##D 
##D # plausible value imputation with normality assumption
##D # and ignoring uncertainty about regression coefficients
##D #    -> the default is samp.regr=FALSE
##D pv2c <- TAM::tam.pv( mod2b, nplausible=10, ntheta=500, normal.approx=TRUE )
##D # sampling of regression coefficients
##D pv2d <- TAM::tam.pv( mod2b, nplausible=10, ntheta=500, samp.regr=TRUE)
##D # sampling of regression coefficients, normal approximation using the
##D # theta grid from the model
##D pv2e <- TAM::tam.pv( mod2b, samp.regr=TRUE, theta.model=TRUE, normal.approx=TRUE)
##D 
##D #--- create list of multiply imputed datasets with plausible values
##D # define dataset with covariates to be matched
##D Y <- dat[, c("idstud", "idschool", "female", "hisei", "migra") ]
##D 
##D # define plausible value names
##D pvnames <- c("PVREAD")
##D # create list of imputed datasets
##D datlist1 <- TAM::tampv2datalist( pv2e, pvnames=pvnames, Y=Y, Y.pid="idstud")
##D str(datlist1)
##D 
##D # create a matrix of covariates with different set of students than in pv2e
##D Y1 <- Y[ seq( 1, 600, 2 ), ]
##D # create list of multiply imputed datasets
##D datlist2 <- TAM::tampv2datalist( pv2e, pvnames=c("PVREAD"), Y=Y1, Y.pid="idstud")
##D 
##D #--- fit some models in lavaan and semTools
##D library(lavaan)
##D library(semTools)
##D 
##D #*** Model 1: Linear regression
##D lavmodel <- "
##D    PVREAD ~ migra + hisei
##D    PVREAD ~~ PVREAD
##D         "
##D mod1 <- semTools::lavaan.mi( lavmodel, data=datlist1, m=0)
##D summary(mod1, standardized=TRUE, rsquare=TRUE)
##D 
##D # apply lavaan for third imputed dataset
##D mod1a <- lavaan::lavaan( lavmodel, data=datlist1[[3]] )
##D summary(mod1a, standardized=TRUE, rsquare=TRUE)
##D 
##D # compare with mod1 by looping over all datasets
##D mod1b <- lapply( datlist1, FUN=function(dat0){
##D     mod1a <- lavaan( lavmodel, data=dat0 )
##D     coef( mod1a)
##D         } )
##D mod1b
##D mod1b <- matrix( unlist( mod1b ), ncol=length( coef(mod1)), byrow=TRUE )
##D mod1b
##D round( colMeans(mod1b), 3 )
##D coef(mod1)   # -> results coincide
##D 
##D #*** Model 2: Path model
##D lavmodel <- "
##D    PVREAD ~ migra + hisei
##D    hisei ~ migra
##D    PVREAD ~~ PVREAD
##D    hisei ~~ hisei
##D         "
##D mod2 <- semTools::lavaan.mi( lavmodel, data=datlist1 )
##D summary(mod2, standardized=TRUE, rsquare=TRUE)
##D # fit statistics
##D inspect( mod2, what="fit")
##D 
##D #--- using mitools package
##D library(mitools)
##D # convert datalist into an object of class imputationList
##D datlist1a <- mitools::imputationList( datlist1 )
##D # fit linear regression
##D mod1c <- with( datlist1a, stats::lm( PVREAD ~ migra + hisei ) )
##D summary( mitools::MIcombine(mod1c) )
##D 
##D #--- using mice package
##D library(mice)
##D library(miceadds)
##D # convert datalist into a mids object
##D mids1 <- miceadds::datalist2mids( datlist1 )
##D # fit linear regression
##D mod1c <- with( mids1, stats::lm( PVREAD ~ migra + hisei ) )
##D summary( mice::pool(mod1c) )
##D 
##D #############################################################################
##D # EXAMPLE 3: Multidimensional plausible value imputation
##D #############################################################################
##D 
##D # (1) simulate some data
##D set.seed(6778)
##D library(mvtnorm)
##D N <- 1000
##D Y <- cbind( stats::rnorm(N), stats::rnorm(N) )
##D theta <- mvtnorm::rmvnorm( N, mean=c(0,0), sigma=matrix( c(1,.5,.5,1), 2, 2 ))
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
##D # (3) fit latent regression model
##D mod <- TAM::tam.mml( resp=resp, Y=Y, Q=Q )
##D 
##D # (4) draw plausible values
##D pv1 <- TAM::tam.pv( mod, theta.model=TRUE )
##D 
##D # (5) convert plausible values to list of imputed datasets
##D Y1 <- data.frame(Y)
##D colnames(Y1) <- paste0("Y",1:2)
##D pvnames <- c("PVFA","PVFB")
##D # create list of imputed datasets
##D datlist1 <- TAM::tampv2datalist( pv1, pvnames=pvnames, Y=Y1 )
##D str(datlist1)
##D 
##D # (6) apply statistical models
##D library(semTools)
##D # define linear regression
##D lavmodel <- "
##D    PVFA ~ Y1 + Y2
##D    PVFA ~~ PVFA
##D         "
##D mod1 <- semTools::lavaan.mi( lavmodel, data=datlist1 )
##D summary(mod1, standardized=TRUE, rsquare=TRUE)
##D 
##D # (7) draw plausible values with tam.pv.mcmc function
##D Y1 <- cbind( 1, Y )
##D pv2 <- TAM::tam.pv.mcmc( tamobj=mod, Y=Y1, n.iter=1000, n.burnin=200 )
##D 
##D # (8) group-specific plausible values
##D set.seed(908)
##D # create artificial grouping variable
##D group <- sample( 1:3, N, replace=TRUE )
##D pv3 <- TAM::tam.pv.mcmc( tamobj, Y=Y1, n.iter=1000, n.burnin=200, group=group )
##D 
##D # (9) plausible values with no fitted object in TAM
##D 
##D # fit IRT model without covariates
##D mod4a <- TAM::tam.mml( resp=resp, Q=Q )
##D # define input for tam.pv.mcmc
##D tamobj1 <- list( AXsi=mod4a$AXsi, B=mod4a$B, resp=mod4a$resp )
##D pmod4 <- TAM::tam.pv.mcmc( tamobj1, Y=Y1 )
##D 
##D #############################################################################
##D # EXAMPLE 4: Plausible value imputation with measurement errors in covariates
##D #############################################################################
##D 
##D library(sirt)
##D set.seed(7756)
##D N <- 2000    # number of persons
##D I <- 10     # number of items
##D 
##D # simulate covariates
##D X <- mvrnorm( N, mu=c(0,0), Sigma=matrix( c(1,.5,.5,1),2,2 ) )
##D colnames(X) <- paste0("X",1:2)
##D # second covariate with measurement error with variance var.err
##D var.err <- .3
##D X.err <- X
##D X.err[,2] <-X[,2] + rnorm(N, sd=sqrt(var.err) )
##D # simulate theta
##D theta <- .5*X[,1] + .4*X[,2] + rnorm( N, sd=.5 )
##D # simulate item responses
##D itemdiff <- seq( -2, 2, length=I)  # item difficulties
##D dat <- sirt::sim.raschtype( theta, b=itemdiff )
##D 
##D #***********************
##D #*** Model 0: Regression model with true variables
##D mod0 <- stats::lm( theta ~ X )
##D summary(mod0)
##D 
##D #***********************
##D #*** Model 1: latent regression model with true covariates X
##D xsi.fixed <- cbind( 1:I, itemdiff )
##D mod1 <- TAM::tam.mml( dat, xsi.fixed=xsi.fixed, Y=X)
##D summary(mod1)
##D 
##D # draw plausible values
##D res1a <- TAM::tam.pv( mod1, normal.approx=TRUE, ntheta=200, samp.regr=TRUE)
##D # create list of multiply imputed datasets
##D library(miceadds)
##D datlist1a <- TAM::tampv2datalist( res1a, Y=X )
##D imp1a <- miceadds::datalist2mids( datlist1a )
##D 
##D # fit linear model
##D # linear regression with measurement errors in X
##D lavmodel <- "
##D    PV.Dim1 ~ X1 + X2true
##D    X2true=~ 1*X2
##D    X2 ~~ 0.3*X2  #=var.err
##D    PV.Dim1 ~~ PV.Dim1
##D    X2true ~~ X2true
##D         "
##D mod1a <- semTools::lavaan.mi( lavmodel, datlist1a)
##D summary(mod1a, standardized=TRUE, rsquare=TRUE)
##D 
##D #***********************
##D #*** Model 2: latent regression model with error-prone covariates X.err
##D mod2 <- TAM::tam.mml( dat, xsi.fixed=xsi.fixed, Y=X.err)
##D summary(mod2)
##D 
##D #***********************
##D #*** Model 3: Adjustment of covariates
##D 
##D cov.X.err <- cov( X.err )
##D # matrix of variance of measurement errors
##D measerr <- diag( c(0,var.err) )
##D # true covariance matrix
##D cov.X <- cov.X.err - measerr
##D # mean of X.err
##D mu <- colMeans(X.err)
##D muM <- matrix( mu, nrow=nrow(X.err), ncol=ncol(X.err), byrow=TRUE)
##D # reliability matrix
##D W <- solve( cov.X.err ) %*% cov.X
##D ident <- diag(2)
##D # adjusted scores of X
##D X.adj <- ( X.err - muM ) %*% W   + muM %*% ( ident - W )
##D 
##D # fit latent regression model
##D mod3 <- TAM::tam.mml( dat, xsi.fixed=xsi.fixed, Y=X.adj)
##D summary(mod3)
##D 
##D # draw plausible values
##D res3a <- TAM::tam.pv( mod3, normal.approx=TRUE, ntheta=200, samp.regr=TRUE)
##D 
##D # create list of multiply imputed datasets
##D library(semTools)
##D 
##D #*** PV dataset 1
##D # datalist with error-prone covariates
##D datlist3a <- TAM::tampv2datalist( res3a, Y=X.err )
##D # datalist with adjusted covariates
##D datlist3b <- TAM::tampv2datalist( res3a, Y=X.adj )
##D 
##D # linear regression with measurement errors in X
##D lavmodel <- "
##D    PV.Dim1 ~ X1 + X2true
##D    X2true=~ 1*X2
##D    X2 ~~ 0.3*X2  #=var.err
##D    PV.Dim1 ~~ PV.Dim1
##D    X2true ~~ X2true
##D         "
##D mod3a <- semTools::lavaan.mi( lavmodel, datlist3a)
##D summary(mod3a, standardized=TRUE, rsquare=TRUE)
##D 
##D lavmodel <- "
##D    PV.Dim1 ~ X1 + X2
##D    PV.Dim1 ~~ PV.Dim1
##D         "
##D mod3b <- semTools::lavaan.mi( lavmodel, datlist3b)
##D summary(mod3b, standardized=TRUE, rsquare=TRUE)
##D #=> mod3b leads to the correct estimate.
##D 
##D #*********************************************
##D # plausible value imputation for abilities and error-prone
##D # covariates using the mice package
##D 
##D library(mice)
##D library(miceadds)
##D 
##D # creating the likelihood for plausible value for abilities
##D mod11 <- TAM::tam.mml( dat, xsi.fixed=xsi.fixed )
##D likePV <- IRT.likelihood(mod11)
##D # creating the likelihood for error-prone covariate X2
##D lavmodel <- "
##D   X2true=~ 1*X2
##D   X2 ~~ 0.3*X2
##D     "
##D mod12 <- lavaan::cfa( lavmodel, data=as.data.frame(X.err) )
##D summary(mod12)
##D likeX2 <- TAM::IRTLikelihood.cfa( data=X.err, cfaobj=mod12)
##D str(likeX2)
##D 
##D #-- create data input for mice package
##D data <- data.frame( "PVA"=NA, "X1"=X[,1], "X2"=NA  )
##D vars <- colnames(data)
##D V <- length(vars)
##D predictorMatrix <- 1 - diag(V)
##D rownames(predictorMatrix) <- colnames(predictorMatrix) <- vars
##D imputationMethod <- rep("norm", V )
##D names(imputationMethod) <- vars
##D imputationMethod[c("PVA","X2")] <- "2l.plausible.values"
##D 
##D #-- create argument lists for plausible value imputation
##D # likelihood and theta grid of plausible value derived from IRT model
##D like <- list( "PVA"=likePV, "X2"=likeX2 )
##D theta <- list( "PVA"=attr(likePV,"theta"),
##D                 "X2"=attr(likeX2, "theta") )
##D #-- initial imputations
##D data.init <- data
##D data.init$PVA <- mod11$person$EAP
##D data.init$X2 <- X.err[,"X2"]
##D 
##D #-- imputation using the mice and miceadds package
##D imp1 <- mice::mice( as.matrix(data), predictorMatrix=predictorMatrix, m=4, maxit=6,
##D              imputationMethod=imputationMethod,  allow.na=TRUE,
##D              theta=theta, like=like, data.init=data.init )
##D summary(imp1)
##D 
##D # compute linear regression
##D mod4a <- with( imp1, stats::lm( PVA ~ X1 + X2 ) )
##D summary( mice::pool(mod4a) )
## End(Not run)



