library(BAS)


### Name: confint.coef.bas
### Title: Compute Credible Intervals for BAS regression coefficients from
###   BAS objects
### Aliases: confint.coef.bas confint
### Keywords: regression

### ** Examples



data("Hald")
hald_gprior <-  bas.lm(Y~ ., data=Hald, alpha=13,
                            prior="g-prior")
coef_hald <- coef(hald_gprior)
confint(coef_hald)
confint(coef_hald, approx=FALSE, nsim=5000)
# extract just the coefficient of X4
confint(coef_hald, parm="X4")





