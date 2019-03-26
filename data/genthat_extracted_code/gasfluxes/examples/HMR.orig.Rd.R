library(gasfluxes)


### Name: HMR.orig
### Title: HMR fit using the Pedersen fitting algorithm
### Aliases: HMR.orig

### ** Examples

#a single fit
t <- c(0, 1/3, 2/3, 1)
C <- c(320, 341, 352, 359)
print(fit <- HMR.orig(t, C, 1, 0.3, "a"))
plot(C ~ t)
curve({fit$phi + fit$f0 * exp(-fit$kappa * x)/(-fit$kappa*0.3)}, 
      from = 0, to = 1, add = TRUE)




