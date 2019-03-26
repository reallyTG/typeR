library(mvdalab)


### Name: R2s
### Title: Cross-validated R2, R2 for X, and R2 for Y for PLS models
### Aliases: R2s print.R2s

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
R2s(mod1)
## Not run: 
##D plot(R2s(mod1))
## End(Not run)



