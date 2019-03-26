library(gamboostLSS)


### Name: Families
### Title: Families for GAMLSS models
### Aliases: Families families GaussianLSS GaussianMu GaussianSigma
###   GammaLSS GammaMu GammaSigma BetaLSS BetaMu BetaPhi NBinomialLSS
###   NBinomialMu NBinomialSigma StudentTLSS StudentTMu StudentTSigma
###   StudentTDf LogNormalLSS LogNormalMu LogNormalSigma WeibullLSS
###   WeibullMu WeibullSigma LogLogLSS LogLogMu LogLogSigma ZIPoLSS ZINBLSS
###   options stab_ngrad stabilize_ngrad stabilize_ngradient
### Keywords: models distributions

### ** Examples

## Example to define a new distribution:
## Students t-distribution with two parameters, df and mu:

## sub-Family for mu
## -> generate object of the class family from the package mboost
newStudentTMu  <- function(mu, df){

    # loss is negative log-Likelihood, f is the parameter to be fitted with
    # id link -> f = mu
    loss <- function(df,  y, f) {
        -1 * (lgamma((df + 1)/2)  - lgamma(1/2) -
              lgamma(df/2) - 0.5 * log(df) -
              (df + 1)/2 * log(1 + (y - f)^2/(df )))
    }
    # risk is sum of loss
    risk <- function(y, f, w = 1) {
        sum(w * loss(y = y, f = f, df = df))
    }
    # ngradient is the negative derivate w.r.t. mu (=f)
    ngradient <- function(y, f, w = 1) {
        (df + 1) * (y - f)/(df  + (y - f)^2)
    }

    # use the Family constructor of mboost
    Family(ngradient = ngradient, risk = risk, loss = loss,
           response = function(f) f,
           name = "new Student's t-distribution: mu (id link)")
}

## sub-Family for df
newStudentTDf <- function(mu, df){

    # loss is negative log-Likelihood, f is the parameter to be fitted with
    # log-link: exp(f) = df
    loss <- function( mu, y, f) {
        -1 * (lgamma((exp(f) + 1)/2)  - lgamma(1/2) -
              lgamma(exp(f)/2) - 0.5 * f -
              (exp(f) + 1)/2 * log(1 + (y - mu)^2/(exp(f) )))
    }
    # risk is sum of loss
    risk <- function(y, f, w = 1) {
        sum(w * loss(y = y, f = f,  mu = mu))
    }
    # ngradient is the negative derivate of the loss w.r.t. f
    # in this case, just the derivative of the log-likelihood 
    ngradient <- function(y, f, w = 1) {
        exp(f)/2 * (digamma((exp(f) + 1)/2) - digamma(exp(f)/2)) -
            0.5 - (exp(f)/2 * log(1 + (y - mu)^2 / (exp(f) )) -
                   (y - mu)^2 / (1 + (y - mu)^2 / exp(f)) * (exp(-f) + 1)/2)
    }
    # use the Family constructor of mboost
    Family(ngradient = ngradient, risk = risk, loss = loss,
           response = function(f) exp(f),
           name = "Student's t-distribution: df (log link)")
}

## families object for new distribution
newStudentT <- Families(mu= newStudentTMu(mu=mu, df=df),
                        df=newStudentTDf(mu=mu, df=df))

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### usage of the new Student's t distribution:
library(gamlss)   ## required for rTF
set.seed(1907)
n <- 5000
x1  <- runif(n)
x2 <- runif(n)
mu <- 2 -1*x1 - 3*x2
df <- exp(1 + 0.5*x1 )
y <- rTF(n = n, mu = mu, nu = df)

## model fitting
model <- glmboostLSS(y ~ x1 + x2, families = newStudentT,
                     control = boost_control(mstop = 100),
                     center = TRUE)
## shrinked effect estimates
coef(model, off2int = TRUE)

## compare to pre-defined three parametric t-distribution:
model2 <- glmboostLSS(y ~ x1 + x2, families = StudentTLSS(),
                      control = boost_control(mstop = 100),
                      center = TRUE)
coef(model2, off2int = TRUE)

## with effect on sigma:
sigma <- 3+ 1*x2
y <- rTF(n = n, mu = mu, nu = df, sigma=sigma)
model3 <- glmboostLSS(y ~ x1 + x2, families = StudentTLSS(),
                      control = boost_control(mstop = 100),
                      center = TRUE)
coef(model3, off2int = TRUE)
## End(No test)




