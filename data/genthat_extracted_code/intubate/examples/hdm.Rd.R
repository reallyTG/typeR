library(intubate)


### Name: hdm
### Title: Interfaces for hdm package for data science pipelines.
### Aliases: ntbt_rlasso ntbt_rlassoATE ntbt_rlassoATET ntbt_rlassoLATE
###   ntbt_rlassoLATET ntbt_rlassoEffects ntbt_rlassoIV ntbt_rlassologit
### Keywords: intubate magrittr hdm rlasso rlassoATE rlassoATET rlassoLATE
###   rlassoLATET rlassoEffects rlassoIV rlassologit tsls

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(hdm)
##D 
##D 
##D ## ntbt_rlasso: rlasso: Function for Lasso estimation under homoscedastic
##D ##                      and heteroscedastic non-Gaussian disturbances
##D set.seed(1)
##D n <- 100 #sample size
##D p <- 100 # number of variables
##D s <- 3 # nubmer of variables with non-zero coefficients
##D X <- Xnames <- matrix(rnorm(n*p), ncol=p)
##D colnames(Xnames) <- paste("V", 1:p, sep="")
##D beta <- c(rep(5,s), rep(0,p-s))
##D Y <- X %*% beta + rnorm(n)
##D 
##D dta <- list(Y = Y, Xnames = Xnames)
##D rm(Y, Xnames)
##D 
##D ## Original function to interface
##D rlasso(Y ~ Xnames, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rlasso(dta, Y ~ Xnames)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rlasso(Y ~ Xnames)
##D 
##D 
##D ## Functions for estimation of treatment effects
##D ## ntbt_rlassoATE, ntbt_rlassoATET, ntbt_rlassoLATE, ntbt_rlassoLATET
##D ## do not have examples of use in help.
##D 
##D ## Original function to interface
##D ## The interface puts data as first parameter
##D ## so it can be used easily in a pipeline.
##D 
##D 
##D 
##D ## ntbt_rlassoEffects: rigorous Lasso for Linear Models: Inference
##D set.seed(1)
##D n <- 100 #sample size
##D p <- 100 # number of variables
##D s <- 3 # nubmer of non-zero variables
##D X <- matrix(rnorm(n*p), ncol=p)
##D colnames(X) <- paste("X", 1:p, sep="")
##D beta <- c(rep(3,s), rep(0,p-s))
##D y <- 1 + X %*% beta + rnorm(n)
##D data <- data.frame(cbind(y,X))
##D colnames(data)[1] <- "y"
##D fm <- paste("y ~", paste(colnames(X), collapse="+"))
##D fm <- as.formula(fm)                 
##D rm(y, X)
##D 
##D ## Original function to interface
##D rlassoEffects(fm, I = ~ X1 + X2 + X3 + X50, data=data)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rlassoEffects(data, fm, I = ~ X1 + X2 + X3 + X50)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_rlassoEffects(fm, I = ~ X1 + X2 + X3 + X50)
##D 
##D 
##D 
##D ## ntbt_rlassoIV: Post-Selection and Post-Regularization Inference
##D ##                in Linear Models with Many Controls and Instruments
##D ## The example uses non-formula variant. Please see note below about
##D ## possible problem.
##D data(EminentDomain)
##D dta <- list(z = EminentDomain$logGDP$z, # instruments
##D             x = EminentDomain$logGDP$x, # exogenous variables
##D             y = EminentDomain$logGDP$y, # outcome varialbe
##D             d = EminentDomain$logGDP$d) # treatment / endogenous variable
##D str(dta)
##D ## Original function to interface
##D attach(dta)
##D rlassoIV(x=x, d=d, y=y, z=z, select.X=FALSE, select.Z=TRUE) 
##D detach()
##D 
##D ## The interface puts data as first parameter
##D ## NOTE: BE CAREFUL (in general in situations as follow)
##D ## The parameter name "d" in this function can result in a nightmare
##D ## (it got me scratching my head for quite a bit).
##D ## In fact, if you call with parameter names (but not naming data)
##D ## call the following version (commented out)
##D # ntbt_rlassoIV(dta, x=x, d=d, y=y, z=z, select.X=FALSE, select.Z=TRUE)
##D ## there will be an error, as R will expand "d" to "data", and use
##D ## its info (d) instead of dta.
##D ## Right now I am not sure how to manage this situation and avoid
##D ## that unwanted expansion. I will get back to this later.
##D ## To avoid problems you should specify "data" as below
##D ntbt_rlassoIV(data=dta, x=x, d=d, y=y, z=z, select.X=FALSE, select.Z=TRUE)
##D ## but of course this beats the purpose (we do not want to name "data"),
##D ## and you *cannot* do it in the pipeline version (as you do not include data
##D ## in your call).
##D ## SOLUTION. In cases of unfortunate parameter names: "d", "da", "dat",
##D ## you need to make sure that that parameter is sent by position AND unnamed
##D ntbt_rlassoIV(dta, x=x, d, y=y, z=z, select.X=FALSE, select.Z=TRUE)
##D ## In general, required data is sent unnamed and by position, like
##D ntbt_rlassoIV(dta, x, d, y, z, select.X = FALSE, select.Z = TRUE)
##D ## and this would have been what I would have done if I would
##D ## (have had the ability to) produce this example.
##D ## But this is how the example was provided, giving an opportunity to
##D ## uncover this potentially unpleasant situation.
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rlassoIV(x, d, y, z, select.X = FALSE, select.Z = TRUE)
##D 
##D 
##D ## ntbt_rlassologit: Function for logistic Lasso estimation
##D library(hdm)
##D ## DGP
##D set.seed(2)
##D n <- 250
##D p <- 100
##D px <- 10
##D X <- matrix(rnorm(n*p), ncol=p)
##D beta <- c(rep(2,px), rep(0,p-px))
##D intercept <- 1
##D P <- exp(intercept + X %*% beta)/(1+exp(intercept + X %*% beta))
##D y <- rbinom(n, size=1, prob=P)
##D dta <- list(y = y, X = X)
##D rm(y, X)
##D 
##D ## Original function to interface
##D rlassologit(y ~ X, dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rlassologit(dta, y ~ X)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rlassologit(y ~ X)
##D 
##D 
##D 
##D ## ntbt_tsls: Two-Stage Least Squares Estimation (TSLS)
##D ## No example provided
## End(Not run)



