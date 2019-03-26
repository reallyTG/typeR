library(Hmisc)


### Name: aregImpute
### Title: Multiple Imputation using Additive Regression, Bootstrapping,
###   and Predictive Mean Matching
### Aliases: aregImpute print.aregImpute plot.aregImpute reformM
### Keywords: smooth regression multivariate methods models

### ** Examples

# Check that aregImpute can almost exactly estimate missing values when
# there is a perfect nonlinear relationship between two variables
# Fit restricted cubic splines with 4 knots for x1 and x2, linear for x3
set.seed(3)
x1 <- rnorm(200)
x2 <- x1^2
x3 <- runif(200)
m <- 30
x2[1:m] <- NA
a <- aregImpute(~x1+x2+I(x3), n.impute=5, nk=4, match='closest')
a
matplot(x1[1:m]^2, a$imputed$x2)
abline(a=0, b=1, lty=2)

x1[1:m]^2
a$imputed$x2


# Multiple imputation and estimation of variances and covariances of
# regression coefficient estimates accounting for imputation
# Example 1: large sample size, much missing data, no overlap in
# NAs across variables
x1 <- factor(sample(c('a','b','c'),1000,TRUE))
x2 <- (x1=='b') + 3*(x1=='c') + rnorm(1000,0,2)
x3 <- rnorm(1000)
y  <- x2 + 1*(x1=='c') + .2*x3 + rnorm(1000,0,2)
orig.x1 <- x1[1:250]
orig.x2 <- x2[251:350]
x1[1:250] <- NA
x2[251:350] <- NA
d <- data.frame(x1,x2,x3,y)
# Find value of nk that yields best validating imputation models
# tlinear=FALSE means to not force the target variable to be linear
f <- aregImpute(~y + x1 + x2 + x3, nk=c(0,3:5), tlinear=FALSE,
                data=d, B=10) # normally B=75
f
# Try forcing target variable (x1, then x2) to be linear while allowing
# predictors to be nonlinear (could also say tlinear=TRUE)
f <- aregImpute(~y + x1 + x2 + x3, nk=c(0,3:5), data=d, B=10)
f

## Not run: 
##D # Use 100 imputations to better check against individual true values
##D f <- aregImpute(~y + x1 + x2 + x3, n.impute=100, data=d)
##D f
##D par(mfrow=c(2,1))
##D plot(f)
##D modecat <- function(u) {
##D  tab <- table(u)
##D  as.numeric(names(tab)[tab==max(tab)][1])
##D }
##D table(orig.x1,apply(f$imputed$x1, 1, modecat))
##D par(mfrow=c(1,1))
##D plot(orig.x2, apply(f$imputed$x2, 1, mean))
##D fmi <- fit.mult.impute(y ~ x1 + x2 + x3, lm, f, 
##D                        data=d)
##D sqrt(diag(vcov(fmi)))
##D fcc <- lm(y ~ x1 + x2 + x3)
##D summary(fcc)   # SEs are larger than from mult. imputation
## End(Not run)
## Not run: 
##D # Example 2: Very discriminating imputation models,
##D # x1 and x2 have some NAs on the same rows, smaller n
##D set.seed(5)
##D x1 <- factor(sample(c('a','b','c'),100,TRUE))
##D x2 <- (x1=='b') + 3*(x1=='c') + rnorm(100,0,.4)
##D x3 <- rnorm(100)
##D y  <- x2 + 1*(x1=='c') + .2*x3 + rnorm(100,0,.4)
##D orig.x1 <- x1[1:20]
##D orig.x2 <- x2[18:23]
##D x1[1:20] <- NA
##D x2[18:23] <- NA
##D #x2[21:25] <- NA
##D d <- data.frame(x1,x2,x3,y)
##D n <- naclus(d)
##D plot(n); naplot(n)  # Show patterns of NAs
##D # 100 imputations to study them; normally use 5 or 10
##D f  <- aregImpute(~y + x1 + x2 + x3, n.impute=100, nk=0, data=d)
##D par(mfrow=c(2,3))
##D plot(f, diagnostics=TRUE, maxn=2)
##D # Note: diagnostics=TRUE makes graphs similar to those made by:
##D # r <- range(f$imputed$x2, orig.x2)
##D # for(i in 1:6) {  # use 1:2 to mimic maxn=2
##D #   plot(1:100, f$imputed$x2[i,], ylim=r,
##D #        ylab=paste("Imputations for Obs.",i))
##D #   abline(h=orig.x2[i],lty=2)
##D # }
##D 
##D table(orig.x1,apply(f$imputed$x1, 1, modecat))
##D par(mfrow=c(1,1))
##D plot(orig.x2, apply(f$imputed$x2, 1, mean))
##D 
##D 
##D fmi <- fit.mult.impute(y ~ x1 + x2, lm, f, 
##D                        data=d)
##D sqrt(diag(vcov(fmi)))
##D fcc <- lm(y ~ x1 + x2)
##D summary(fcc)   # SEs are larger than from mult. imputation
## End(Not run)

## Not run: 
##D # Study relationship between smoothing parameter for weighting function
##D # (multiplier of mean absolute distance of transformed predicted
##D # values, used in tricube weighting function) and standard deviation
##D # of multiple imputations.  SDs are computed from average variances
##D # across subjects.  match="closest" same as match="weighted" with
##D # small value of fweighted.
##D # This example also shows problems with predicted mean
##D # matching almost always giving the same imputed values when there is
##D # only one predictor (regression coefficients change over multiple
##D # imputations but predicted values are virtually 1-1 functions of each
##D # other)
##D 
##D set.seed(23)
##D x <- runif(200)
##D y <- x + runif(200, -.05, .05)
##D r <- resid(lsfit(x,y))
##D rmse <- sqrt(sum(r^2)/(200-2))   # sqrt of residual MSE
##D 
##D y[1:20] <- NA
##D d <- data.frame(x,y)
##D f <- aregImpute(~ x + y, n.impute=10, match='closest', data=d)
##D # As an aside here is how to create a completed dataset for imputation
##D # number 3 as fit.mult.impute would do automatically.  In this degenerate
##D # case changing 3 to 1-2,4-10 will not alter the results.
##D imputed <- impute.transcan(f, imputation=3, data=d, list.out=TRUE,
##D                            pr=FALSE, check=FALSE)
##D sd <- sqrt(mean(apply(f$imputed$y, 1, var)))
##D 
##D ss <- c(0, .01, .02, seq(.05, 1, length=20))
##D sds <- ss; sds[1] <- sd
##D 
##D for(i in 2:length(ss)) {
##D   f <- aregImpute(~ x + y, n.impute=10, fweighted=ss[i])
##D   sds[i] <- sqrt(mean(apply(f$imputed$y, 1, var)))
##D }
##D 
##D plot(ss, sds, xlab='Smoothing Parameter', ylab='SD of Imputed Values',
##D      type='b')
##D abline(v=.2,  lty=2)  # default value of fweighted
##D abline(h=rmse, lty=2)  # root MSE of residuals from linear regression
## End(Not run)

## Not run: 
##D # Do a similar experiment for the Titanic dataset
##D getHdata(titanic3)
##D h <- lm(age ~ sex + pclass + survived, data=titanic3)
##D rmse <- summary(h)$sigma
##D set.seed(21)
##D f <- aregImpute(~ age + sex + pclass + survived, n.impute=10,
##D                 data=titanic3, match='closest')
##D sd <- sqrt(mean(apply(f$imputed$age, 1, var)))
##D 
##D ss <- c(0, .01, .02, seq(.05, 1, length=20))
##D sds <- ss; sds[1] <- sd
##D 
##D for(i in 2:length(ss)) {
##D   f <- aregImpute(~ age + sex + pclass + survived, data=titanic3,
##D                   n.impute=10, fweighted=ss[i])
##D   sds[i] <- sqrt(mean(apply(f$imputed$age, 1, var)))
##D }
##D 
##D plot(ss, sds, xlab='Smoothing Parameter', ylab='SD of Imputed Values',
##D      type='b')
##D abline(v=.2,   lty=2)  # default value of fweighted
##D abline(h=rmse, lty=2)  # root MSE of residuals from linear regression
## End(Not run)

d <- data.frame(x1=rnorm(50), x2=c(rep(NA, 10), runif(40)),
                x3=c(runif(4), rep(NA, 11), runif(35)))
reformM(~ x1 + x2 + x3, data=d)
reformM(~ x1 + x2 + x3, data=d, nperm=2)
# Give result or one of the results as the first argument to aregImpute



