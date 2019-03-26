library(eco)


### Name: ecoNP
### Title: Fitting the Nonparametric Bayesian Models of Ecological
###   Inference in 2x2 Tables
### Aliases: ecoNP
### Keywords: models

### ** Examples



## load the registration data
data(reg)

## NOTE: We set the number of MCMC draws to be a very small number in
## the following examples; i.e., convergence has not been properly
## assessed. See Imai, Lu and Strauss (2006) for more complete examples.

## fit the nonparametric model to give in-sample predictions
## store the parameters to make population inference later
## Not run: 
##D res <- ecoNP(Y ~ X, data = reg, n.draws = 50, param = TRUE, verbose = TRUE)
##D 
##D ##summarize the results
##D summary(res)
##D 
##D ## obtain out-of-sample prediction
##D out <- predict(res, verbose = TRUE)
##D 
##D ## summarize the results
##D summary(out)
##D 
##D ## density plots of the out-of-sample predictions
##D par(mfrow=c(2,1))
##D plot(density(out[,1]), main = "W1")
##D plot(density(out[,2]), main = "W2")
##D 
##D 
##D ## load the Robinson's census data
##D data(census)
##D 
##D ## fit the parametric model with contextual effects and N 
##D ## using the default prior specification
##D 
##D res1 <- ecoNP(Y ~ X, N = N, context = TRUE, param = TRUE, data = census, 
##D n.draws = 25, verbose = TRUE)
##D 
##D ## summarize the results
##D summary(res1)
##D 
##D ## out-of sample prediction 
##D pres1 <- predict(res1)
##D summary(pres1)
## End(Not run)




