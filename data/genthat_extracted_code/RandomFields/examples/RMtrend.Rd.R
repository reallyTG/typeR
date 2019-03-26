library(RandomFields)


### Name: RMtrend
### Title: Trend Model
### Aliases: RMtrend trend RM_TREND
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## first simulate some data with a sine and a mean as trend
repet <- 100
## Don't show: 
if(RFoptions()$internal$examples_reduced){warning("reduced 'repet'"); repet <- 3}
## End(Don't show) 
x <- seq(0, pi, len=10)
trend <- 2 * sin(R.p(new="isotropic")) + 3
model1 <- RMexp(var=2, scale=1) + trend
dta <- RFsimulate(model1, x=x, n=repet)



## now, let us estimate variance, scale, and two parameters of the trend
model2 <- RMexp(var=NA, scale=NA) + NA * sin(R.p(new="isotropic")) + NA
## Don't show: 
if(RFoptions()$internal$examples_reduced){warning("reduced 'repet'"); model2 <- RMexp(var=NA) + NA * sin(R.p(new="isotropic")) + NA}
## End(Don't show)
print(RFfit(model2, data=dta))

## model2 can be made explicit by enclosing the trend parts by
## 'RMtrend'
model3 <- RMexp(var=NA, scale=NA) + NA *
          RMtrend(sin(R.p(new="isotropic"))) + RMtrend(NA)
print(RFfit(model2, data=dta))


## IMPORTANT:  subtraction is not a way to combine definite models
##             with trends
trend <- -1
(model0 <- RMexp(var=0.4) + trend) ## exponential covariance with mean -1
(model1 <- RMexp(var=0.4) + -1)    ## same as model0
(model2 <- RMexp(var=0.4) + RMtrend(-1)) ## same as model0
(model3 <- RMexp(var=0.4) - 1) ## this is a purely deterministic model
                               ## with exponential trend
plot(RFsimulate(model=model0, x=x, y=x)) ## exponential covariance
                               ##           and mean -1
plot(RFsimulate(model=model1, x=x, y=x)) ## dito
plot(RFsimulate(model=model2, x=x, y=x)) ## dito
plot(RFsimulate(model=model3, x=x, y=x)) ## purely deterministic model!



## Don't show: ## Not run: 
##D ##################################################
##D # Example 1: # 
##D # Simulate from model with a plane trend surface #
##D ##################################################
##D 
##D #trend: 1 + x - y, cov: exponential with variance 0.01
##D model <- ~ RMtrend(mean=1, plane = c(1,-1)) + RMexp(var=0.04)
##D #equivalent model:
##D model <- ~ RMtrend(polydeg=1,polycoeff=c(1,1,-1)) + RMexp(var=0.4)
##D #Simulation
##D x <- 0:10
##D simulated0 <- RFsimulate(model=model, x=x, y=x)
##D plot(simulated0)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D 
##D ## PLOT SIEHT NICHT OK AUS !!
##D 
##D ####################################################################
##D #
##D # Example 2: Simulate and fit a multivariate geostatistical model
##D #
##D ####################################################################
##D  
##D # Simulate a bivariate Gaussian random field with trend
##D # m_1((x,y)) = x + 2*y and m_2((x,y)) = 3*x + 4*y
##D # where m_1 is a hyperplane describing the trend for the first response
##D # variable and m_2 is the trend for the second one;
##D # the covariance function is the sum of a bivariate Whittle-Matern model
##D # and a multivariate nugget effect
##D x <- y <- 0:10
##D x <- y <- seq(0, 10, 0.1)
##D model <- RMtrend(plane=matrix(c(1,2,3,4), ncol=2)) + 
##D          RMparswm(nu=c(1,1)) + RMnugget(var=0.5)
##D multi.simulated <- RFsimulate(model=model, x=x, y=y)
##D plot(multi.simulated)
##D 
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D # Fit the Gaussian random field with unknown trend for the second
##D # response variable and unknown variances
##D model.na <- RMtrend(plane=matrix(c(1, 2, NA, NA), ncol=2)) + 
##D             RMparswm(nu=c(1,1), var=NA) + RMnugget(var=NA)
##D fit <- RFfit(model=model.na, data=multi.simulated)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D ##################################################
##D #
##D # Example 3:  Simulation and estimation for model with 
##D #             arbitrary trend functions
##D #
##D ##################################################
##D 
##D #Simulation
##D # trend: 2*sin(x) + 0.5*cos(y), cov: spherical with scale 3
##D model <- ~ RMtrend(arbitraryfct=function(x) sin(x),
##D  fctcoeff=2) +
##D  RMtrend(arbitraryfct=function(y) cos(y),
##D  fctcoeff=0.5) +
##D  RMspheric(scale=3)
##D x <- seq(-4*pi, 4*pi, pi/10)
##D simulated <- RFsimulate(model=model, x=x, y=x)
##D plot(simulated)
##D 
##D ################# ?? !!
##D #Estimation, part 1
##D # estimate coefficients and scale
##D model.est <- ~ RMtrend(arbitraryfct=function(x) sin(x), fctcoeff=1) +
##D  RMtrend(arbitraryfct=function(y) cos(y), fctcoeff=1) +
##D  RMspheric(scale=NA)
##D estimated <- RFfit(model=model.est, x=x, y=x,
##D  data=simulated@data, mle.methods="ml")
##D 
##D 
##D #Estimation
##D # estimate coefficients and scale
##D model.est <- ~ RMtrend(arbitraryfct=function(x) sin(x)) +
##D  RMtrend(arbitraryfct=function(y) cos(y)) +
##D  RMspheric(scale=NA)
##D estimated <- RFfit(model=model.est, x=x, y=x,
##D  data=simulated@data, mle.methods="ml")
##D 
##D 
##D 
##D ##################################################
##D #
##D # Example 4: Simulation and estimation for model with 
##D #            polynomial trend 
##D #
##D ##################################################
##D 
##D #Simulation
##D # trend: 2*x^2 - 3 y^2, cov: whittle-matern with nu=1,scale=0.5
##D model <- ~ RMtrend(arbitraryfct=function(x) 2*x^2 - 3*y^2,
##D  fctcoeff=1) + RMwhittle(nu=1, scale=0.5)
##D # equivalent model:
##D model <- ~ RMtrend(polydeg=2, polycoeff=c(0,0,2,0,0,-3))
##D x <- 0:20		 
##D simulated <- RFsimulate(model=model, x=x, y=x)
##D plot(simulated)
##D 
##D #Estimation
##D # estimate nu and the trend term assuming that it is a polynomial
##D # of degree 2
##D model.est <- ~ RMtrend(polydeg=2) + RMwhittle(nu=NA, scale=0.5)
##D estimated <- RFfit(model=model.est, x=x, y=x,
##D  data=simulated@data, mle.methods="ml")
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


