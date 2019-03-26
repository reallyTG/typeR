library(gasfluxes)


### Name: HMR.fit
### Title: HMR fit
### Aliases: HMR.fit

### ** Examples

#a single fit
t <- c(0, 1/3, 2/3, 1)
C <- c(320, 341, 352, 359)
print(fit <- HMR.fit(t, C, 1, 0.3, "a"))
plot(C ~ t)
curve({fit$phi + fit$f0 * exp(-fit$kappa * x)/(-fit$kappa*0.3)}, 
      from = 0, to = 1, add = TRUE)
#compare with fitting function from HMR package 0.3.1
  gasfluxes:::.HMR.fit1(t, C,
                  1, 0.3, "a",
                  ngrid = 1000, LR.always = FALSE, FollowHMR = TRUE, 
                  JPG = FALSE, PS = FALSE, PHMR = FALSE, npred = 500, 
                  xtxt = "", ytxt = "", pcttxt = "",
                  MSE.zero = 10 * max(.Machine$double.eps, .Machine$double.neg.eps), 
                  bracketing.tol = 1e-07, bracketing.maxiter = 1000)[2:4]

## Not run: 
##D #a dataset of 1329 chamber N2O flux measurements
##D data(fluxMeas)
##D fluxMeas[, n := length(time), by=serie]
##D print(fluxMeas)
##D fluxes <- fluxMeas[n > 3, HMR.fit(time, C, A, V, serie), by=serie]
##D print(fluxes)
##D plot(f0.se ~ f0, data = fluxes)
##D #one very large f0.se value (and several infinite ones not shown in the plot)
##D fluxes[is.finite(f0.se),][which.max(f0.se),]
##D plot(C~time, data=fluxMeas[serie=="ID940",])
##D print(tmp <- fluxes[is.finite(f0.se),][which.max(f0.se),])
##D curve({tmp[, phi] + tmp[, f0] * exp(-tmp[, kappa] * x)/
##D       (-tmp[, kappa]*fluxMeas[serie=="ID940", V[1]]/
##D       fluxMeas[serie=="ID940",A[1]])}, 
##D       from = 0, to = 1, add = TRUE)
##D plot(f0.se ~ f0, data = fluxes[f0.se < 1e4,], pch = 16)
##D boxplot(fluxes[f0.se < 1e4, sqrt(f0.se)])
## End(Not run)




