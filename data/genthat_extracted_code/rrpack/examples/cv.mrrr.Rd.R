library(rrpack)


### Name: cv.mrrr
### Title: Mixed-response reduced-rank regression with rank selected by
###   cross validation
### Aliases: cv.mrrr

### ** Examples

## Not run: 
##D library(rrpack)
##D simdata <- rrr.sim3(n = 100, p = 30, q.mix = c(5, 20, 5),
##D                     nrank = 2, mis.prop = 0.2)
##D Y <- simdata$Y
##D Y_mis <- simdata$Y.mis
##D X <- simdata$X
##D X0 <- cbind(1,X)
##D C <- simdata$C
##D family <- simdata$family
##D familygroup <- simdata$familygroup
##D svdX0d1 <- svd(X0)$d[1]
##D init1 = list(kappaC0 = svdX0d1 * 5)
##D offset = NULL
##D control = list(epsilon = 1e-4, sv.tol = 1e-2, maxit = 2000,
##D                trace = FALSE, gammaC0 = 1.1, plot.cv = TRUE,
##D                conv.obj = TRUE)
##D fit.cv.mrrr <- cv.mrrr(Y_mis, X, family = family,
##D                        familygroup = familygroup,
##D                        maxrank = 20,
##D                        penstr = list(penaltySVD = "rankCon",
##D                                      lambdaSVD = c(1 : 6)),
##D                        control = control, init = init1,
##D                        nfold = 10, nlam = 50)
##D summary(fit.cv.mrrr)
##D coef(fit.cv.mrrr)
##D fit.mrrr <- fit.cv.mrrr$fit
##D 
##D ## plot(svd(fit.mrrr$coef[- 1,])$d)
##D plot(C ~ fit.mrrr$coef[- 1, ])
##D abline(a = 0, b = 1)
## End(Not run)



