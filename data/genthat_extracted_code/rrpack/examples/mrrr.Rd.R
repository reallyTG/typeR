library(rrpack)


### Name: mrrr
### Title: Generalized or mixed-response reduced-rank regression
### Aliases: mrrr

### ** Examples

library(rrpack)
simdata <- rrr.sim3(n = 100, p = 30, q.mix = c(5, 20, 5),
                    nrank = 2, mis.prop = 0.2)
Y <- simdata$Y
Y_mis <- simdata$Y.mis
X <- simdata$X
X0 <- cbind(1, X)
C <- simdata$C
family <- simdata$family
familygroup <- simdata$familygroup
svdX0d1 <- svd(X0)$d[1]
init1 = list(kappaC0 = svdX0d1 * 5)
offset = NULL
control = list(epsilon = 1e-4, sv.tol = 1e-2, maxit = 2000,
               trace = FALSE, gammaC0 = 1.1, plot.cv = TRUE,
               conv.obj = TRUE)
fit.mrrr <- mrrr(Y_mis, X, family = family, familygroup = familygroup,
                 penstr = list(penaltySVD = "rankCon", lambdaSVD = 2),
                 control = control, init = init1)
summary(fit.mrrr)
coef(fit.mrrr)
par(mfrow = c(1, 2))
plot(fit.mrrr$obj)
plot(C ~ fit.mrrr$coef[- 1 ,])
abline(a = 0, b = 1)



