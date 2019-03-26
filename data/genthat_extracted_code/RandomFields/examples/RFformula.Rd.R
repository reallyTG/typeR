library(RandomFields)


### Name: RFformula
### Title: RFformula - syntax to design random field models with trend or
###   linear mixed models
### Aliases: RFformula RMformula
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFoptions(modus_operandi="sloppy")

##############################################################
#
# Example  : Simulation and fitting of a two-dimensional
# Gaussian random field with exponential covariance function
#
###############################################################

V <- 10
S <- 0.3
M <- 3
model <- RMexp(var=V, scale=S) + M
x <- y <- seq(1, 3, 0.1)

simulated <- RFsimulate(model = model, x=x, y=y)
plot(simulated)


# an alternative code to the above code:
model <- ~ Mean + RMexp(var=Var, scale=Sc)
simulated2 <- RFsimulate(model = model,x=x, y=y, Var=V, Sc=S, Mean=M)
plot(simulated2)


# a third way of specifying the model using the argument 'param'
# the initials of the variables do not be captical letters
model <- ~ M + RMexp(var=var, scale=sc)
simulated3 <- RFsimulate(model = model,x=x, y=y,
                         param=list(var=V, sc=S, M=M))
plot(simulated3)


# Estimate parameters of underlying covariance function via
# maximum likelihood
model.na <- ~ NA + RMexp(var=NA, scale=NA)
fitted <- RFfit(model=model.na, data=simulated)

# compare sample mean of data with ML estimate, which is very similar:
mean(simulated@data[,1]) 
fitted


## Don't show: ## Not run: 
##D ##############################################################
##D #
##D # Example 2: Fitting a standard linear mixed model using maximum
##D # likelihood to estimate the variance components
##D #
##D ###############################################################
##D 
##D # Y = W*beta + Z*u + e
##D # where u ~ N(0, (sigma_u)^2 A) and e ~ N(0, (sigma_e)^2)
##D W <- rep(1,times=10)
##D Z <- matrix(rnorm(150) ,nrow=10, ncol=15)
##D A <- RFcovmatrix(0:14, model=RMexp()) 
##D response <- W*5 + Z##D 
##D 
##D # Estimate beta, (sigma_u)^2 and (sigma_e)^2:
##D model <- response ~ W@RMfixed(beta=NA) +
##D  Z@RMfixcov(A, var=NA) +
##D  RMnugget(var=NA)
##D fitted <- RFfit(model=model, data=response, W=W, Z=Z, A=A)
## End(Not run)## End(Don't show)


## Don't show: ## Not run: 
##D #### THIS EXAMPLE IS NOT PROGRAMMED YET
##D 
##D 
##D ###########################################################
##D #
##D # Example 3: Simulate and fit a geostatistical model
##D #
##D ###########################################################
##D 
##D # Simulate a Gaussian random field with trend m((x,y)) = 2 + 1.5 x - 3 y
##D # with vector of coordinates (x,y)
##D # and covariance function C(s,t) = 3*exp(-||(2*(s_1-t_1),s_2-t_2)||) +
##D # 1.5*exp(-||(2*(s_1-t_1),s_2-t_2)||^2)
##D # for s=(s_1,s_2) and t=(t_1,t_2)
##D 
##D model <- ~ RMtrend(mean=2) +
##D  RMtrend(arbitraryfct=function(x) x, fctcoeff=1.5) +
##D  RMtrend(arbitraryfct=function(y) y, fctcoeff=-3) + 
##D  RMplus(RMexp(var=3), RMgauss(var=1.5),
##D  Aniso=matrix(c(2,0,0,1),nrow=2))
##D 
##D simulated <- RFsimulate(model=model,x=seq(0,2,0.1),y=seq(-1,3,0.2))
##D 
##D # equivalent model
##D model <- RMtrend(polydeg=1, polycoeff=c(2, 1.5, .3)) +
##D  RMplus(RMexp(var=3), RMgauss(var=1.5),
##D  Aniso=matrix(c(2,0,0,1), nrow=2))
##D 
##D simulated <- RFsimulate(model=model, x=seq(0,2,0.1), y=seq(-1,3,0.2))
##D 
##D # Estimate trend (polynomial of degree 1) and variance components such
##D # that var_exp = 2*var_gauss as in the true model used for simulation
##D model.na <- ~ RMtrend(polydeg=1) +
##D  RMplus(RMexp(var=2),RMgauss(var=2),var=NA,
##D         Aniso=matrix(c(NA,0,0,NA),nrow=2))
##D fit <- RFfit(model=model.na, data=simulated)
## End(Not run)## End(Don't show)



## Don't show: ## Not run: 
##D #### THIS EXAMPLE IS NOT PROGRAMMED YET
##D 
##D ####################################################################
##D #
##D # Example 4: Simulate and fit a multivariate geostatistical model
##D #
##D ####################################################################
##D 
##D # Simulate a bivariate Gaussian random field with trend
##D # m_1((x,y)) = x + 2*y and m_2((x,y)) = 3*x + 4*y
##D # where m_1 is a hyperplane describing the trend for the first response
##D # variable and m_2 is the trend for the second one;
##D # the covariance function is a multivariate nugget effect
##D x <- y <- 0:10
##D model <- ~ RMtrend(plane=matrix(c(1,2,3,4), ncol=2)) +
##D            RMnugget(var=0.5, vdim=2)
##D multi.simulated <- RFsimulate(model=model, x=x, y=y)
##D 
##D # Fit the Gaussian random field with unknown trend for the second
##D # response variable and unknown variances
##D model.na <- ~ RMtrend(plane=matrix(c(NA,NA,NA,NA), ncol=2)) + 
##D               RMnugget(var=NA, vdim=2)
##D fit <- RFfit(model=model.na, data=multi.simulated)
## End(Not run)## End(Don't show)

## Don't show: 
RFoptions(modus_operandi="normal")
## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


