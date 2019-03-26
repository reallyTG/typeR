library(miceadds)


### Name: mice.impute.plausible.values
### Title: Plausible Value Imputation using Classical Test Theory and Based
###   on Individual Likelihood
### Aliases: mice.impute.plausible.values
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Plausible value imputation for data.ma04 | 2 scales
##D #############################################################################
##D 
##D data(data.ma04, package="miceadds")
##D dat <- data.ma04
##D 
##D # Scale 1 consists of items A1,...,A4
##D # Scale 2 consists of items B1,...,B5
##D dat$scale1 <- NA
##D dat$scale2 <- NA
##D 
##D #** inits imputation method and predictor matrix
##D res <- miceadds::mice_inits(dat, ignore=c("group") )
##D predM <- res$predictorMatrix
##D impMethod <- res$method
##D impMethod <- gsub("pmm", "norm", impMethod )
##D 
##D # look at missing proportions
##D colSums( is.na(dat) )
##D 
##D # redefine imputation methods for plausible value imputation
##D impMethod[ "scale1" ] <- "plausible.values"
##D predM[ "scale1",  ] <- 1
##D predM[ "scale1", c("A1", "A2",  "A3", "A4" ) ] <- 3
##D     # items corresponding to a scale should be declared by a 3 in the predictor matrix
##D impMethod[ "scale2" ] <- "plausible.values"
##D predM[,"scale2"  ] <- 0
##D predM[ "scale2",  c("A2","A3","A4","V6","V7") ] <- 1
##D diag(predM) <- 0
##D 
##D # use imputed scale values as predictors for V5, V6 and V7
##D predM[ c("V5","V6","V7"), c("scale1","scale2" ) ] <- 1
##D # exclude for V5, V6 and V7 the items of scales A and B as predictors
##D predM[ c("V5","V6","V7"), c( paste0("A",2:4), paste0("B",1:5) ) ] <- 0
##D # exclude 'group' as a predictor
##D predM[,"group"] <- 0
##D 
##D # look at imputation method and predictor matrix
##D impMethod
##D predM
##D 
##D #-------------------------------
##D # Parameter for imputation
##D #***
##D # scale 1 (A1,...,A4)
##D # known Cronbach's Alpha
##D alpha <- NULL
##D alpha <- list( "scale1"=.8 )
##D alpha.se <- list( "scale1"=.05 )  # sample alpha with a standard deviation of .05
##D 
##D #***
##D # scale 2 (B1,...,B5)
##D # means and SE's of scale scores are assumed to be known
##D M.scale2 <- rowMeans( dat[, paste("B",1:5,sep="")  ] )
##D # M.scale2[ is.na( m1) ] <- mean( M.scale2, na.rm=TRUE )
##D SE.scale2 <- rep( sqrt( stats::var(M.scale2,na.rm=T)*(1-.8) ), nrow(dat) )
##D #=> heterogeneous measurement errors are allowed
##D scale.values <- list( "scale2"=list( "M"=M.scale2, "SE"=SE.scale2 ) )
##D 
##D #*** Imputation Model 1: Imputation four using parallel chains
##D imp1 <- mice::mice( dat, predictorMatrix=predM, m=4, maxit=5,
##D           alpha.se=alpha.se, method=impMethod,  allow.na=TRUE, alpha=alpha,
##D           scale.values=scale.values  )
##D summary(imp1)
##D 
##D # extract first imputed dataset
##D dat11 <- mice::complete( imp, 1 )
##D 
##D #*** Imputation Model 2: Imputation using one long chain
##D imp2 <- miceadds::mice.1chain( dat, predictorMatrix=predM, burnin=10, iter=20, Nimp=4,
##D           alpha.se=alpha.se, method=impMethod,  allow.na=TRUE, alpha=alpha,
##D           scale.values=scale.values )
##D summary(imp2)
##D 
##D #-------------
##D #*** Imputation Model 3: Imputation including  group level variables
##D 
##D # use group indicator for plausible value estimation
##D predM[ "scale1", "group" ] <- -2
##D # V7 and B1 should be aggregated at the group level
##D predM[ "scale1", c("V7","B1") ] <- 2
##D predM[ "scale2", "group" ] <- -2
##D predM[ "scale2", c("V7","A1") ] <- 2
##D 
##D # perform single imputation (m=1)
##D imp <- mice::mice( dat, predictorMatrix=predM, m=1, maxit=10,
##D             method=impMethod,  allow.na=TRUE, alpha=alpha,
##D             scale.values=scale.values )
##D dat10 <- mice::complete(imp)
##D 
##D # multilevel model
##D library(lme4)
##D mod <- lme4::lmer( scale1 ~ ( 1 | group), data=dat11 )
##D summary(mod)
##D 
##D mod <- lme4::lmer( scale1 ~ ( 1 | group), data=dat10)
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 2: Plausible value imputation with chained equations
##D #############################################################################
##D 
##D # - simulate a latent variable theta and dichotomous item responses
##D # - two covariates X in which the second covariate has measurement error
##D 
##D library(sirt)
##D library(TAM)
##D library(lavaan)
##D 
##D set.seed(7756)
##D N <- 2000    # number of persons
##D I <- 10     # number of items
##D 
##D # simulate covariates
##D X <- MASS::mvrnorm( N, mu=c(0,0), Sigma=matrix( c(1,.5,.5,1),2,2 ) )
##D colnames(X) <- paste0("X",1:2)
##D # second covariate with measurement error with variance var.err
##D var.err <- .3
##D X.err <- X
##D X.err[,2] <- X[,2] + stats::rnorm(N, sd=sqrt(var.err) )
##D # simulate theta
##D theta <- .5*X[,1] + .4*X[,2] + stats::rnorm( N, sd=.5 )
##D # simulate item responses
##D itemdiff <- seq( -2, 2, length=I)  # item difficulties
##D dat <- sirt::sim.raschtype( theta, b=itemdiff )
##D 
##D #***********************
##D #*** Model 0: Regression model with true variables
##D mod0 <- stats::lm( theta ~ X )
##D summary(mod0)
##D 
##D #**********************
##D # plausible value imputation for abilities and error-prone
##D # covariates using the mice package
##D 
##D # creating the likelihood for plausible value for abilities
##D mod11 <- TAM::tam.mml( dat )
##D likePV <- IRT.likelihood(mod11)
##D # creating the likelihood for error-prone covariate X2
##D # The known measurement error variance is 0.3.
##D lavmodel <- "
##D   X2true=~ 1*X2
##D   X2 ~~ 0.3*X2
##D     "
##D mod12 <- lavaan::cfa( lavmodel, data=as.data.frame(X.err) )
##D summary(mod12)
##D likeX2 <- IRTLikelihood.cfa( data=X.err, cfaobj=mod12)
##D str(likeX2)
##D 
##D #-- create data input for mice package
##D data <- data.frame( "PVA"=NA, "X1"=X[,1], "X2"=NA  )
##D vars <- colnames(data)
##D V <- length(vars)
##D predictorMatrix <- 1 - diag(V)
##D rownames(predictorMatrix) <- colnames(predictorMatrix) <- vars
##D method <- rep("norm", V )
##D names(method) <- vars
##D method[c("PVA","X2")] <- "plausible.values"
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
##D imp1 <- mice::mice( as.matrix(data), predictorMatrix=predictorMatrix, m=4,
##D             maxit=6, method=method,  allow.na=TRUE,
##D             theta=theta, like=like, data.init=data.init )
##D summary(imp1)
##D 
##D # compute linear regression
##D mod4a <- with( imp1, stats::lm( PVA ~ X1 + X2 ) )
##D summary( mice::pool(mod4a) )
##D 
##D #############################################################################
##D # EXAMPLE 3: Plausible value imputation with known error variance
##D #############################################################################
##D 
##D #---- simulate data
##D set.seed(987)
##D N <- 1000         # number of persons
##D var_err <- .4     # error variance
##D dat <- data.frame( x1=stats::rnorm(N), x2=stats::rnorm(N) )
##D dat$theta <- .3 * dat$x1 - .5*dat$x2 + stats::rnorm(N)
##D dat$y <- dat$theta + stats::rnorm( N, sd=sqrt(var_err) )
##D 
##D #-- linear regression for measurement-error-free data
##D mod0a <- stats::lm( theta ~ x1 + x2, data=dat )
##D summary(mod0a)
##D #-- linear regression for data with measurement error
##D mod0b <- stats::lm( y ~ x1 + x2, data=dat )
##D summary(mod0b)
##D 
##D #-- process data for imputation
##D 
##D dat1 <- dat
##D dat1$theta <- NA
##D scale.values <- list( "theta"=list( "M"=dat$y, "SE"=rep(sqrt(var_err),N )))
##D dat1$y <- NULL
##D 
##D cn <- colnames(dat1)
##D V <- length(cn)
##D method <- rep("", length(cn) )
##D names(method) <- cn
##D method["theta"] <- "plausible.values"
##D 
##D #-- imputation in mice
##D imp <- mice::mice( dat1, maxit=1, m=5, allow.na=TRUE, method=method,
##D             scale.values=scale.values )
##D summary(imp)
##D 
##D #-- inspect first dataset
##D summary( mice::complete(imp, action=1) )
##D 
##D #-- linear regression based on imputed datasets
##D mod1 <- with(imp, stats::lm( theta ~ x1 + x2 ) )
##D summary( mice::pool(mod1) )
## End(Not run)



