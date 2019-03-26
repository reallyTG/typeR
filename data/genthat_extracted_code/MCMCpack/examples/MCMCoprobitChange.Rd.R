library(MCMCpack)


### Name: MCMCoprobitChange
### Title: Markov Chain Monte Carlo for Ordered Probit Changepoint
###   Regression Model
### Aliases: MCMCoprobitChange
### Keywords: models

### ** Examples


set.seed(1909)
N <- 200
x1 <- rnorm(N, 1, .5);

## set a true break at 100
z1 <- 1 + x1[1:100] + rnorm(100);
z2 <- 1 -0.2*x1[101:200] + rnorm(100);
z <- c(z1,  z2);
y <- z

## generate y
y[z < 1] <- 1;
y[z >= 1 & z < 2] <- 2;
y[z >= 2] <- 3;

## inputs
formula <- y ~ x1

## fit multiple models with a varying number of breaks
out1 <- MCMCoprobitChange(formula, m=1,
      	mcmc=100, burnin=100, thin=1, tune=c(.5, .5), verbose=100,
     	b0=0, B0=10, marginal.likelihood = "Chib95")
out2 <- MCMCoprobitChange(formula, m=2,
      	mcmc=100, burnin=100, thin=1, tune=c(.5, .5, .5), verbose=100,
     	b0=0, B0=10, marginal.likelihood = "Chib95")

## Do model comparison
## NOTE: the chain should be run longer than this example!
BayesFactor(out1, out2)

## draw plots using the "right" model
plotState(out1)
plotChangepoint(out1)




