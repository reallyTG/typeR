library(treatSens)


### Name: treatSens
### Title: Performing Dual-Parameter Sensitivity Analysis
### Aliases: treatSens

### ** Examples

N = 250          #number of observations

zetay = .5             #coefficient on U in the outcome model
zetaz = .5             #coefficient on U in the treatment model
betaz = c(.75,-.5,.25) #coefficients of X in the treatment model
betay = c(.5,1,-1.5)   #coefficients of X in the outcome model
tau = .25              #treatment effect

X = matrix(rnorm(3*N),N,3)           #covariates

###################################
# Example with continuous treatment
set.seed(836)
U = rnorm(N, 0, 1)         #unmeasured confounder
Z = rnorm(N,X %*% betaz + zetaz*U,1)         #treatment variable
Y = rnorm(N,X %*% betay + zetay*U + tau*Z,2) #outcome variable

# sensitivity analysis
# small grid.dim and nsim just for example purposes
out.cont <- treatSens(Y~Z+X, grid.dim = c(3,2), nsim = 5,
                     standardize = FALSE, verbose = TRUE, zero.loc = "full")

sensPlot(out.cont) # draw contour plot
# You can see when zetay=zetaz=.5, tau is about .25.

###############################
# Example with binary treatment
set.seed(725)
U = rbinom(N,1,.5)                   #unmeasured confounder
ps = pnorm(X%*%betaz + zetaz*(U-.5)) #propensity score
Z = rbinom(N,1,ps)                   #treatment variable
epsilon = rnorm(N,0,2)               #error term
Y0 = X%*%betay + zetay*(U-.5) + epsilon       #potential outcome(Z=0)
Y1 = X%*%betay + zetay*(U-.5) + tau + epsilon #potential outcome(Z=1)
Y = Y0*(1-Z) + Y1*Z                  #realization of potential outcome

# sensitivity analysis
out.bin <- treatSens(Y~Z+X, trt.family = binomial(link="probit"), nsim = 3, 
                      spy.range = c(0,4), spz.range = c(-2,2),grid.dim = c(5,3),
                      standardize = FALSE, verbose = TRUE)

sensPlot(out.bin) # draw contour plot




