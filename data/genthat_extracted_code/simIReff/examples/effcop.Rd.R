library(simIReff)


### Name: effcop
### Title: Fit Vine copula models to matrices of effectiveness scores
### Aliases: effcop effcopFit reffcop

### ** Examples

## No test: 
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
## End(No test)



