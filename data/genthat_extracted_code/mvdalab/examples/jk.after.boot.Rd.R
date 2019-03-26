library(mvdalab)


### Name: jk.after.boot
### Title: Jackknife After Bootstrap
### Aliases: jk.after.boot

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
jk.after.boot(mod1, type = "coefficients")
## Not run: 
##D jk.after.boot(mod1, type = "loadings")
##D jk.after.boot(mod1, type = "weights")
## End(Not run)



