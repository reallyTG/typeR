library(smoothSurv)


### Name: smoothSurvReg
### Title: Regression for a Survival Model with Smoothed Error Distribution
### Aliases: smoothSurvReg C_smoothSurvReg84
### Keywords: survival smooth

### ** Examples

##### EXAMPLE 1:  Common scale
##### ========================
### We generate interval censored data and fit a model with few artificial covariates
set.seed(221913282)
x1 <- rbinom(50, 1, 0.4)                                         ## binary covariate
x2 <- rnorm(50, 180, 10)                                         ## continuous covariate
y1 <- 0.5*x1 - 0.01*x2 + 0.005 *x1*x2 + 1.5*rnorm(50, 0, 1)      ## generate log(T), left limit
t1 <- exp(y1)                                                    ## left limit of the survival time
t2 <- t1 + rgamma(50, 1, 1)                                      ## right limit of the survival time
surv <- Surv(t1, t2, type = "interval2")                         ## survival object

## Fit the model with an interaction
fit1 <- smoothSurvReg(surv ~ x1 * x2, logscale = ~1, info = FALSE, lambda = exp(2:(-1)))

## Print the summary information
summary(fit1, spline = TRUE)

## Plot the fitted error distribution
plot(fit1)

## Plot the fitted error distribution with its components
plot(fit1, components = TRUE)

## Plot the cumulative distribution function corresponding to the error density
survfit(fit1, cdf = TRUE)

## Plot survivor curves for persons with (x1, x2) = (0, 180) and (1, 180)
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
survfit(fit1, cov = cov)

## Plot hazard curves for persons with (x1, x2) = (0, 180) and (1, 180)
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
hazard(fit1, cov = cov)

## Plot densities for persons with (x1, x2) = (0, 180) and (1, 180)
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
fdensity(fit1, cov = cov)

## Compute estimates expectations of survival times for persons with
## (x1, x2) = (0, 180), (1, 180), (0, 190), (1, 190), (0, 200), (1, 200)
## and estimates of a difference of these expectations:
## T(0, 180) - T(1, 180), T(0, 190) - T(1, 190), T(0, 200) - T(1, 200),
cov1 <- matrix(c(0, 180, 0,   0, 190, 0,   0, 200, 0), ncol = 3, byrow = TRUE)
cov2 <- matrix(c(1, 180, 180,   1, 190, 190,   1, 200, 200), ncol = 3, byrow = TRUE)
print(estimTdiff(fit1, cov1 = cov1, cov2 = cov2))


##### EXAMPLE 2:  Scale depends on covariates
##### =======================================
### We generate interval censored data and fit a model with few artificial covariates
set.seed(221913282)
x1 <- rbinom(50, 1, 0.4)                                        ## binary covariate
x2 <- rnorm(50, 180, 10)                                        ## continuous covariate
x3 <- runif(50, 0, 1)                                           ## covariate for the scale parameter
logscale <- 1 + x3
scale <- exp(logscale)
y1 <- 0.5*x1 - 0.01*x2 + 0.005 *x1*x2 + scale*rnorm(50, 0, 1)    ## generate log(T), left limit
t1 <- exp(y1)                                                    ## left limit of the survival time
t2 <- t1 + rgamma(50, 1, 1)                                      ## right limit of the survival time
surv <- Surv(t1, t2, type = "interval2")                         ## survival object

## Fit the model with an interaction
fit2 <- smoothSurvReg(surv ~ x1 * x2, logscale = ~x3, info = FALSE, lambda = exp(2:(-1)))

## Print the summary information
summary(fit2, spline = TRUE)

## Plot the fitted error distribution
plot(fit2)

## Plot the fitted error distribution with its components
plot(fit2, components = TRUE)

## Plot survivor curves for persons with (x1, x2) = (0, 180) and (1, 180)
## x3 = 0.8 and 0.9
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
logscale.cov <- c(0.8, 0.9)
survfit(fit2, cov = cov, logscale.cov = logscale.cov)

## Plot hazard curves for persons with (x1, x2) = (0, 180) and (1, 180)
## x3 = 0.8 and 0.9
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
logscale.cov <- c(0.8, 0.9)
hazard(fit2, cov = cov, logscale.cov=c(0.8, 0.9))

## Plot densities for persons with (x1, x2) = (0, 180) and (1, 180)
## x3 = 0.8 and 0.9
cov <- matrix(c(0, 180, 0,   1, 180, 180), ncol = 3, byrow = TRUE)
logscale.cov <- c(0.8, 0.9)
fdensity(fit2, cov = cov, logscale.cov = logscale.cov)


## More involved examples can be found in script files
## used to perform analyses  and draw pictures 
## presented in above mentioned references.
## These scripts and some additional files can be found as *.tar.gz files
## in the /inst/doc directory of this package.
##



