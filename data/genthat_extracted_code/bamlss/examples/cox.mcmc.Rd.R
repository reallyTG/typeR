library(bamlss)


### Name: cox.mcmc
### Title: Cox Model Markov Chain Monte Carlo
### Aliases: cox.mcmc
### Keywords: regression survival

### ** Examples

## Not run: 
##D library("survival")
##D set.seed(123)
##D 
##D ## Simulate survival data.
##D d <- simSurv(n = 500)
##D 
##D ## Formula of the survival model, note
##D ## that the baseline is given in the first formula by s(time).
##D f <- list(
##D   Surv(time, event) ~ s(time) + s(time, by = x3),
##D   gamma ~ s(x1) + s(x2)
##D )
##D 
##D ## Cox model with continuous time.
##D ## Note the the family object cox_bamlss() sets
##D ## the default optimizer and sampler function!
##D ## First, posterior mode estimates are computed
##D ## using function cox.mode(), afterwards the
##D ## sampler cox.mcmc() is started.
##D b <- bamlss(f, family = "cox", data = d)
##D 
##D ## Plot estimated effects.
##D plot(b)
## End(Not run)



