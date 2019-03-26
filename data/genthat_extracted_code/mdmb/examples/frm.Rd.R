library(mdmb)


### Name: frm
### Title: Factored Regression Model: Generalized Linear Regression Model
###   with Missing Covariates
### Aliases: frm frm_em coef.frm_em vcov.frm_em logLik.frm_em
###   summary.frm_em frm_fb coef.frm_fb plot.frm_fb vcov.frm_fb
###   summary.frm_fb frm2datlist

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Simulated example linear regression with interaction effects
##D #############################################################################
##D 
##D # The interaction model stats::lm( Y ~ X + Z + X:Z) is of substantive interest.
##D # There can be missing values in all variables.
##D 
##D data(data.mb01)
##D dat <- data.mb01$missing
##D 
##D #******************************************
##D # Model 1: ML approach
##D 
##D #--- specify models
##D 
##D # define integration nodes
##D xnodes <- seq(-4,4,len=11)        # nodes for X
##D ynodes <- seq(-10,10,len=13)
##D   # nodes for Y. These ynodes are not really necessary for this dataset because
##D   # Y has no missing values.
##D 
##D # define model for dependent variable Y
##D dep <- list("model"="linreg", "formula"=Y ~  X*Z, "nodes"=ynodes )
##D 
##D # model P(X|Z)
##D ind_X <- list( "model"="linreg", "formula"=X ~ Z, "nodes"=xnodes )
##D # all models for covariates
##D ind <- list( "X"=ind_X )
##D 
##D #--- estimate model with numerical integration
##D mod1 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind )
##D summary(mod1)
##D 
##D # extract some informations
##D coef(mod1)
##D vcov(mod1)
##D logLik(mod1)
##D 
##D #******************************************
##D # Model 2: Fully Bayesian approach / Multiple Imputation
##D 
##D #--- define models
##D dep <- list("model"="linreg", "formula"=Y ~  X*Z )
##D ind_X <- list( "model"="linreg", "formula"=X ~ Z  )
##D ind_Z <- list( "model"="linreg", "formula"=Z ~ 1  )
##D ind <- list( "X"=ind_X, Z=ind_Z)
##D 
##D #--- estimate model
##D mod2 <- mdmb::frm_fb(dat, dep, ind, burnin=200, iter=1000)
##D summary(mod2)
##D #* plot parameters
##D plot(mod2)
##D 
##D #--- create list of multiply imputed datasets
##D datlist <- mdmb::frm2datlist(mod2)
##D # convert into object of class mids
##D imp2 <- miceadds::datlist2mids(datlist)
##D # estimate linear model on multiply imputed datasets
##D mod2c <- with(imp2, stats::lm( Y ~ X*Z ) )
##D summary( mice::pool(mod2c) )
##D 
##D #******************************************
##D # Model 3: Multiple imputation in jomo package
##D 
##D library(jomo)
##D 
##D # impute with substantive model containing interaction effects
##D formula <- Y ~ X*Z
##D imp <- jomo::jomo.lm( formula=formula, data=dat, nburn=100, nbetween=100)
##D 
##D # convert to object of class mids
##D datlist <- miceadds::jomo2mids( imp )
##D # estimate linear model
##D mod3 <- with(datlist, lm( Y ~ X*Z ) )
##D summary( mice::pool(mod3) )
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated example logistic regression with interaction effects
##D #############################################################################
##D 
##D # Interaction model within a logistic regression Y ~ X + Z + X:Z
##D # Y and Z are dichotomous variables.
##D 
##D # attach data
##D data(data.mb02)
##D dat <- data.mb02$missing
##D 
##D #******************************************
##D # Model 1: ML approach
##D 
##D #--- specify model
##D 
##D # define nodes
##D xnodes <- seq(-5,5,len=15)  # X - normally distributed variable
##D ynodes <- c(0,1)                # Y and Z dichotomous variable
##D 
##D # model P(Y|X,Z) for dependent variable
##D dep <- list("model"="logistic", "formula"=Y ~  X*Z, "nodes"=ynodes )
##D # model P(X|Z)
##D ind_X <- list( "model"="linreg", "formula"=X ~ Z, "nodes"=xnodes )
##D # model P(Z)
##D ind_Z <- list( "model"="logistic", "formula"=Z ~ 1, "nodes"=ynodes )
##D ind <- list(  "Z"=ind_Z, "X"=ind_X )
##D 
##D #--- estimate model with numerical integration
##D mod1 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind )
##D summary(mod1)
##D 
##D #******************************************
##D # Model 2: Fully Bayesian approach
##D 
##D #--- specify model
##D dep <- list("model"="logistic", "formula"=Y ~  X*Z  )
##D ind_X <- list( "model"="linreg", "formula"=X ~ Z )
##D ind_Z <- list( "model"="logistic", "formula"=Z ~ 1 )
##D ind <- list(  "Z"=ind_Z, "X"=ind_X )
##D 
##D #--- Bayesian estimation
##D mod2 <- mdmb::frm_fb(dat=dat, dep=dep, ind=ind, burnin=500, iter=1000 )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 3: Confirmatory factor analysis
##D #############################################################################
##D 
##D # A latent variable can be considered as missing data and the 'frm_em' function
##D # is used to estimate the latent variable model.
##D 
##D #--- simulate data
##D N <- 1000
##D set.seed(91834)
##D # latent variable
##D theta <- stats::rnorm(N)
##D # simulate items
##D y1 <- 1.5 + 1*theta + stats::rnorm(N, sd=.7 )
##D y2 <- 1.9 + .7*theta + stats::rnorm(N, sd=1 )
##D y3 <- .9 + .7*theta + stats::rnorm(N, sd=.2 )
##D dat <- data.frame(y1,y2,y3)
##D dat$theta <- NA
##D 
##D #******************************************
##D # Model 1: ML approach
##D 
##D #--- define model
##D nodes <- seq(-4,4,len=21)
##D ind_y1 <- list("model"="linreg", "formula"=y1 ~  offset(1*theta),
##D                 "nodes"=nodes )
##D ind_y2 <- list( "model"="linreg", "formula"=y2 ~ theta, "nodes"=nodes,
##D                 "coef_inits"=c(NA,1) )
##D ind_y3 <- list( "model"="linreg", "formula"=y3 ~ theta, "nodes"=nodes,
##D                  "coef_inits"=c(1,1) )
##D dep <- list( "model"="linreg", "formula"=theta ~ 0, "nodes"=nodes )
##D ind <- list( "y1"=ind_y1,  "y2"=ind_y2, "y3"=ind_y3)
##D 
##D #*** estimate model with mdmb::frm_em
##D mod1 <- mdmb::frm_em(dat, dep, ind)
##D summary(mod1)
##D 
##D #*** estimate model in lavaan
##D library(lavaan)
##D lavmodel <- "
##D      theta=~ 1*y1 + y2 + y3
##D      theta ~~ theta
##D      "
##D mod1b <- lavaan::cfa( model=lavmodel, data=dat )
##D summary(mod1b)
##D 
##D # compare likelihood
##D logLik(mod1)
##D logLik(mod1b)
##D 
##D #############################################################################
##D # EXAMPLE 4: Rasch model
##D #############################################################################
##D 
##D #--- simulate data
##D set.seed(91834)
##D N <- 500
##D # latent variable
##D theta0 <- theta <- stats::rnorm(N)
##D # number of items
##D I <- 7
##D dat <- sirt::sim.raschtype( theta, b=seq(-1.5,1.5,len=I) )
##D colnames(dat) <- paste0("I",1:I)
##D dat$theta <- NA
##D 
##D #******************************************
##D # Model 1: ML approach
##D 
##D #--- define model
##D nodes <- seq(-4,4,len=13)
##D dep <- list("model"="linreg", "formula"=theta ~  0, "nodes"=nodes )
##D ind <- list()
##D for (ii in 1:I){
##D     ind_ii <- list( "model"="logistic", formula=
##D                  stats::as.formula( paste0("I",ii, " ~ offset(1*theta)") ) )
##D     ind[[ii]] <- ind_ii
##D }
##D names(ind) <- colnames(dat)[-(I+1)]
##D 
##D #--- estimate Rasch model with mdmb::frm_em
##D mod1 <- mdmb::frm_em(dat, dep, ind )
##D summary(mod1)
##D 
##D #--- estmate Rasch model with sirt package
##D library(sirt)
##D mod2 <- sirt::rasch.mml2( dat[,-(I+1)], theta.k=nodes, use.freqpatt=FALSE)
##D summary(mod2)
##D 
##D #** compare estimated parameters
##D round(cbind(coef(mod1), c( mod2$sd.trait, -mod2$item$thresh[ seq(I,1)] ) ), 3)
##D 
##D #############################################################################
##D # EXAMPLE 5: Regression model with measurement error in covariates
##D #############################################################################
##D 
##D #--- simulate data
##D set.seed(768)
##D N <- 1000
##D # true score
##D theta <- stats::rnorm(N)
##D # heterogeneous error variance
##D var_err <- stats::runif(N, .5, 1)
##D # simulate observed score
##D x <- theta + stats::rnorm(N, sd=sqrt(var_err) )
##D # simulate outcome
##D y <- .3 + .7 * theta + stats::rnorm( N, sd=.8 )
##D dat0 <- dat <- data.frame( y=y, x=x, theta=theta )
##D 
##D #*** estimate model with true scores (which are unobserved in real datasets)
##D mod0 <- stats::lm( y ~ theta, data=dat0 )
##D summary(mod0)
##D 
##D #******************************************
##D # Model 1: Model-based approach
##D 
##D #--- specify model
##D dat$theta <- NA
##D nodes <- seq(-4,4,len=15)
##D dep <- list( "model"="linreg", "formula"=y ~ theta, "nodes"=nodes,
##D                 "coef_inits"=c(NA, .4 ) )
##D ind <- list()
##D ind[["theta"]] <- list( "model"="linreg", "formula"=theta ~ 1,
##D                          "nodes"=nodes  )
##D ind[["x"]] <- list( "model"="linreg", "formula"=x ~ 0 + offset(theta),
##D                         "nodes"=nodes )
##D # assumption of heterogeneous known error variance
##D ind[["x"]]$sigma_fixed <- sqrt( var_err )
##D 
##D #--- estimate regression model
##D mod1 <- mdmb::frm_em(dat, dep, ind )
##D summary(mod1)
##D 
##D #******************************************
##D # Model 2: Fully Bayesian estimation
##D 
##D #--- specify model
##D dep <- list( "model"="linreg", "formula"=y ~ theta )
##D ind <- list()
##D ind[["theta"]] <- list( "model"="linreg", "formula"=theta ~ 1  )
##D ind[["x"]] <- list( "model"="linreg", "formula"=x ~ 0 + offset(theta) )
##D # assumption of heterogeneous known error variance
##D ind[["x"]]$sigma_fixed <- sqrt( var_err )
##D data_init <- dat
##D data_init$theta <- dat$x
##D 
##D # estimate model
##D mod2 <- mdmb::frm_fb(dat, dep, ind, burnin=200, iter=1000, data_init=data_init)
##D summary(mod2)
##D plot(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 6: Non-normally distributed covariates:
##D #            Positive values with Box-Cox transformation
##D #############################################################################
##D 
##D # simulate data with chi-squared distributed covariate from
##D # regression model Y ~ X
##D set.seed(876)
##D n <- 1500
##D df <- 2
##D x <- stats::rchisq( n, df=df )
##D x <- x / sqrt( 2*df)
##D y <- 0 + 1*x
##D R2 <- .25    # explained variance
##D y <- y + stats::rnorm(n, sd=sqrt( (1-R2)/R2 * 1) )
##D dat0 <- dat <- data.frame( y=y, x=x )
##D 
##D # simulate missing responses
##D prop_miss <- .5
##D cor_miss <- .7
##D resp_tend <- cor_miss*(dat$y-mean(y) )/ stats::sd(y) +
##D                  stats::rnorm(n, sd=sqrt( 1 - cor_miss^2) )
##D dat[ resp_tend < stats::qnorm( prop_miss ), "x" ] <- NA
##D summary(dat)
##D 
##D #-- complete data
##D mod0 <- stats::lm( y ~ x, data=dat0 )
##D summary(mod0)
##D #-- listwise deletion
##D mod1 <- stats::lm( y ~ x, data=dat )
##D summary(mod1)
##D 
##D # normal distribution assumption for frm
##D 
##D # define models
##D dep <- list("model"="linreg", "formula"=y ~  x )
##D # normally distributed data
##D ind_x1 <- list( "model"="linreg", "formula"=x ~ 1 )
##D # Box-Cox normal distribution
##D ind_x2 <- list( "model"="bctreg", "formula"=x ~ 1,
##D               nodes=c( seq(0.05, 3, len=31), seq( 3.5, 9, by=.5 ) ) )
##D ind1 <- list( "x"=ind_x1 )
##D ind2 <- list( "x"=ind_x2 )
##D 
##D #--- incorrect normal distribution assumption
##D mod1 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind1 )
##D summary(mod1)
##D 
##D #--- model chi-square distribution of predictor with Box-Cox transformation
##D mod2 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind2 )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 7: Latent interaction model
##D #############################################################################
##D 
##D # A latent interaction model Y ~ FX + FZ is of interest. Y is directly observed,
##D # FX and FZ are both indirectly observed by three items
##D 
##D #--- simulate data
##D N <- 1000
##D set.seed(987)
##D # latent variable
##D FX <- stats::rnorm(N)
##D FZ <- stats::rnorm(N)
##D # simulate items
##D x1 <- 1.5 + 1*FX + stats::rnorm(N, sd=.7 )
##D x2 <- 1.9 + .7*FX + stats::rnorm(N, sd=1 )
##D x3 <- .9 + .7*FX + stats::rnorm(N, sd=.2 )
##D z1 <- 1.5 + 1*FZ + stats::rnorm(N, sd=.7 )
##D z2 <- 1.9 + .7*FZ + stats::rnorm(N, sd=1 )
##D z3 <- .9 + .7*FZ + stats::rnorm(N, sd=.2 )
##D dat <- data.frame(x1,x2,x3,z1,z2,z3)
##D dat$FX <- NA
##D dat$FZ <- NA
##D dat$y <- 2 + .5*FX + .3*FZ + .4*FX*FZ + rnorm( N, sd=1 )
##D 
##D # estimate interaction model with ML
##D 
##D #--- define model
##D nodes <- seq(-4,4,len=11)
##D ind_x1 <- list("model"="linreg", "formula"=x1 ~  offset(1*FX),
##D                 "nodes"=nodes )
##D ind_x2 <- list( "model"="linreg", "formula"=x2 ~ FX, "nodes"=nodes,
##D                 "coef_inits"=c(NA,1) )
##D ind_x3 <- list( "model"="linreg", "formula"=x3 ~ FX, "nodes"=nodes,
##D                  "coef_inits"=c(1,1) )
##D ind_FX <- list( "model"="linreg", "formula"=FX ~ 0, "nodes"=nodes )
##D ind_z1 <- list("model"="linreg", "formula"=z1 ~  offset(1*FZ),
##D                 "nodes"=nodes )
##D ind_z2 <- list( "model"="linreg", "formula"=z2 ~ FZ, "nodes"=nodes,
##D                 "coef_inits"=c(NA,1) )
##D ind_z3 <- list( "model"="linreg", "formula"=z3 ~ FZ, "nodes"=nodes,
##D                  "coef_inits"=c(1,1) )
##D ind_FZ <- list( "model"="linreg", "formula"=FZ ~ 0 + FX, "nodes"=nodes )
##D ind <- list( "x1"=ind_x1,  "x2"=ind_x2, "x3"=ind_x3, "FX"=ind_FX,
##D             "z1"=ind_z1,  "z2"=ind_z2, "z3"=ind_z3, "FX"=ind_FZ )
##D dep <- list( "model"="linreg", formula=y ~ FX+FZ+FX*FZ, "coef_inits"=c(1,.2,.2,0) )
##D 
##D #*** estimate model with mdmb::frm_em
##D mod1 <- mdmb::frm_em(dat, dep, ind)
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 8: Non-ignorable data in Y
##D #############################################################################
##D 
##D # regression Y ~ X in which Y is missing depending Y itself
##D 
##D library(mvtnorm)
##D cor_XY <- .4        # correlation between X and Y
##D prop_miss <- .5     # missing proportion
##D cor_missY <- .7     # correlation with missing propensity
##D N <- 3000           # sample size
##D 
##D #----- simulate data
##D set.seed(790)
##D Sigma <- matrix( c(1, cor_XY, cor_XY, 1), 2, 2 )
##D mu <- c(0,0)
##D dat <- mvtnorm::rmvnorm( N, mean=mu, sigma=Sigma )
##D colnames(dat) <- c("X","Y")
##D dat <- as.data.frame(dat)
##D 
##D #-- generate missing responses on Y depending on Y itself
##D y1 <- dat$Y
##D miss_tend <- cor_missY * y1  + rnorm(N, sd=sqrt( 1 - cor_missY^2) )
##D dat$Y[ miss_tend < quantile( miss_tend, prop_miss ) ] <- NA
##D 
##D #--- ML estimation under assumption of ignorability
##D nodes <- seq(-5,5,len=15)
##D dep <- list("model"="linreg", "formula"=Y ~  X, "nodes"=nodes )
##D ind_X <- list( "model"="linreg", "formula"=X ~ 1, "nodes"=nodes )
##D ind <- list( "X"=ind_X )
##D mod1 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind)
##D summary(mod1)
##D 
##D #--- ML estimation under assumption with specifying a model for non-ignorability
##D #    for response indicator resp_Y
##D dat$resp_Y <- 1* ( 1 - is.na(dat$Y) )
##D dep <- list("model"="linreg", "formula"=Y ~  X, "nodes"=nodes )
##D ind_X <- list( "model"="linreg", "formula"=X ~ 1, "nodes"=nodes )
##D ind_respY <- list( "model"="logistic", "formula"=resp_Y ~ Y, "nodes"=nodes )
##D ind <- list( "X"=ind_X, "resp_Y"=ind_respY )
##D mod2 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 9: Ordinal variables: Graded response model
##D #############################################################################
##D 
##D #--- simulate data
##D N <- 2000
##D set.seed(91834)
##D # latent variable
##D theta <- stats::rnorm(N)
##D # simulate items
##D y1 <- 1*theta + stats::rnorm(N)
##D y2 <- .7*theta + stats::rnorm(N)
##D y3 <- .7*theta + stats::rnorm(N)
##D # discretize variables
##D y1 <- as.numeric( cut( y1, breaks=c(-Inf, -.5, 0.4, 1, Inf ) ) ) - 1
##D y2 <- as.numeric( cut( y2, breaks=c(-Inf, 0.3, 1, Inf ) ) ) - 1
##D y3 <- as.numeric( cut( y3, breaks=c(-Inf, .2, Inf ) ) ) - 1
##D # define dataset
##D dat <- data.frame(y1,y2,y3)
##D dat$theta <- NA
##D 
##D #******************************************
##D # Model 1: Fully Bayesian estimation
##D 
##D #--- define model
##D ind_y1 <- list( "model"="oprobit", "formula"=y1 ~  offset(1*theta) )
##D ind_y2 <- list( "model"="oprobit", "formula"=y2 ~ theta )
##D ind_y3 <- list( "model"="oprobit", "formula"=y3 ~ theta )
##D dep <- list( "model"="linreg", "formula"=theta ~ 0  )
##D ind <- list( "y1"=ind_y1,  "y2"=ind_y2, "y3"=ind_y3)
##D # initial data
##D data_init <- dat
##D data_init$theta <- as.numeric( scale(dat$y1) ) + stats::rnorm(N, sd=.4 )
##D 
##D #-- estimate model
##D iter <- 3000; burnin <- 1000
##D mod1 <- mdmb::frm_fb(dat=dat, dep=dep, ind=ind, data_init=data_init,
##D                    iter=iter, burnin=burnin)
##D summary(mod1)
##D plot(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 10: Imputation for missig predictors in models with interaction
##D #             effects in multilevel regression models
##D #############################################################################
##D 
##D library(miceadds)
##D data(data.mb04, package="mdmb")
##D dat <- data.mb04
##D 
##D #*** model specification
##D mcmc_iter <- 4   # number of MCMC iterations for model parameter sampling
##D model_formula <- y ~ cwc(x, idcluster) + gm(x, idcluster) + w + w*cwc(x, idcluster) +
##D                    w*gm(x, idcluster) + ( 1 + cwc(x, idcluster) | idcluster)
##D dep <- list("model"="mlreg", "formula"=model_formula,
##D                R_args=list(iter=mcmc_iter, outcome="normal") )
##D ind_x <- list( "model"="mlreg", "formula"=x ~ w + (1|idcluster), R_args=list(iter=mcmc_iter),
##D                   sampling_level="idcluster" )
##D # group means of x are involved in the outcome model. Therefore, Metropolis-Hastings
##D # sampling of missing values in x should be conducted at the level of clusters,
##D # i.e. specifying sampling_level
##D ind <- list("x"=ind_x)
##D 
##D # --- estimate model
##D mod1 <- mdmb::frm_fb(dat, dep, ind, aggregation=TRUE)
##D # argument aggregation is necessary because group means are involved in regression formulas
##D 
##D #-------------
##D #*** imputation of a continuous level-2 variable w
##D 
##D #  create artificially some missings on w
##D dat[ dat$idcluster %%3==0, "w" ] <- NA
##D 
##D # define level-2 model with argument variable_level
##D ind_w <- list( "model"="linreg", "formula"=w ~ 1, "variable_level"="idcluster" )
##D ind <- list( x=ind_x, w=ind_w)
##D 
##D #* conduct imputations
##D mod2 <- mdmb::frm_fb(dat, dep, ind, aggregation=TRUE)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 11: Bounded variable combined with Yeo-Johnson transformation
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(876)
##D n <- 1500
##D x <- mdmb::ryjt_scaled( n, location=-.2, shape=.8, lambda=.9, probit=TRUE)
##D R2 <- .25    # explained variance
##D y <- 1*x + stats::rnorm(n, sd=sqrt( (1-R2)/R2 * stats::var(x)) )
##D dat0 <- dat <- data.frame( y=y, x=x )
##D 
##D # simulate missing responses
##D prop_miss <- .5
##D cor_miss <- .7
##D resp_tend <- cor_miss*(dat$y-mean(y) )/ stats::sd(y) +
##D                  stats::rnorm(n, sd=sqrt( 1 - cor_miss^2) )
##D dat[ resp_tend < stats::qnorm(prop_miss), "x" ] <- NA
##D summary(dat)
##D 
##D #*** define models
##D dep <- list("model"="linreg", "formula"=y ~  x )
##D # distribution according to Yeo-Johnson transformation
##D ind_x1 <- list( "model"="yjtreg", "formula"=x ~ 1 )
##D # distribution according to Probit Yeo-Johnson transformation
##D ind_x2 <- list( "model"="yjtreg", "formula"=x ~ 1, R_args=list("probit"=TRUE ) )
##D ind1 <- list( "x"=ind_x1 )
##D ind2 <- list( "x"=ind_x2 )
##D 
##D #--- complete data
##D mod0 <- stats::lm( y~x, data=dat0)
##D summary(mod0)
##D 
##D #--- Yeo-Johnson normal distribution (for unbounded variables)
##D mod1 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind1 )
##D summary(mod1)
##D 
##D #--- Probit Yeo-Johnson normal distribution (for bounded variable on (0,1))
##D mod2 <- mdmb::frm_em(dat=dat, dep=dep, ind=ind2)
##D summary(mod2)
##D 
##D #--- same model, but MCMC estimation
##D mod3 <- mdmb::frm_fb(dat, dep, ind=ind2, burnin=2000, iter=5000)
##D summary(mod3)
##D plot(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 12: Yeo-Johnson transformation with estimated degrees of freedom
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(876)
##D n <- 1500
##D x <- mdmb::ryjt_scaled( n, location=-.2, shape=.8, lambda=.9, df=10 )
##D R2 <- .25    # explained variance
##D y <- 1*x + stats::rnorm(n, sd=sqrt( (1-R2)/R2 * stats::var(x)) )
##D dat0 <- dat <- data.frame( y=y, x=x )
##D 
##D # simulate missing responses
##D prop_miss <- .5
##D cor_miss <- .7
##D resp_tend <- cor_miss*(dat$y-mean(y) )/ stats::sd(y) +
##D                  stats::rnorm(n, sd=sqrt( 1-cor_miss^2) )
##D dat[ resp_tend < stats::qnorm(prop_miss), "x" ] <- NA
##D summary(dat)
##D 
##D #*** define models
##D dep <- list("model"="linreg", "formula"=y ~  x )
##D # specify distribution with estimated degrees of freedom
##D ind_x <- list( "model"="yjtreg", "formula"=x ~ 1, R_args=list(est_df=TRUE ) )
##D ind <- list( "x"=ind_x )
##D 
##D #--- Yeo-Johnson t distribution
##D mod1 <- mdmb::frm_fb(dat=dat, dep=dep, ind=ind, iter=3000, burnin=1000 )
##D summary(mod1)
## End(Not run)



