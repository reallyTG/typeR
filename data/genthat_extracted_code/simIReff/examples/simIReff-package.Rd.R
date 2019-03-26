library(simIReff)


### Name: simIReff-package
### Title: 'simIReff': Stochastic Simulation for Information Retrieval
###   Evaluation: Effectiveness Scores
### Aliases: simIReff simIReff-package

### ** Examples

## No test: 
## Fit a marginal AP distribution and simulate new data
x <- web2010ap[,10] # sample AP scores of a system
e <- effContFitAndSelect(x, method = "BIC") # fit and select based on log-likelihood
plot(e) # plot pdf, cdf and quantile function
e$mean # expected value
y <- reff(50, e) # simulation of 50 new topics

## Transform the distribution to have a pre-specified expected value
e2 <- effTransform(e, mean = .14) # transform for expected value of .14
plot(e2)
e2$mean # check the result

## Build a copula model of two systems
d <- web2010ap[,2:3] # sample AP scores
e1 <- effCont_norm(d[,1]) # force the first margin to follow a truncated gaussian
e2 <- effCont_bks(d[,2]) # force the second margin to follow a beta kernel-smoothed
cop <- effcopFit(d, list(e1, e2)) # copula
y <- reffcop(1000, cop) # simulation of 1000 new topics
c(e1$mean, e2$mean) # expected means
colMeans(y) # observed means

## Modify the model to both systems have the same distribution
cop2 <- cop # copy the model
cop2$margins[[2]] <- e1 # modify 2nd margin
y <- reffcop(1000, cop2) # simulation of 1000 new topics
colMeans(y) # observed means

## Automatically build a gaussian copula to many systems
d <- web2010p20[,1:20] # sample P@20 data from 20 systems
effs <- effDiscFitAndSelect(d, support("p20")) # fit and select margins
cop <- effcopFit(d, effs, family_set = "gaussian") # fit copula
y <- reffcop(1000, cop) # simulate new 1000 topics

# compare observed vs. expected mean
E <- sapply(effs, function(e) e$mean)
E.hat <- colMeans(y)
plot(E, E.hat)
abline(0:1)

# compare observed vs. expected variance
Var <- sapply(effs, function(e) e$var)
Var.hat <- apply(y, 2, var)
plot(Var, Var.hat)
abline(0:1)

# compare distributions
o <- order(colMeans(d))
boxplot(d[,o])
points(colMeans(d)[o], col = "red", pch = 4) # plot means
boxplot(y[,o])
points(colMeans(y)[o], col = "red", pch = 4) # plot means
## End(No test)



