library(mitml)


### Name: confint.mitml.testEstimates
### Title: Compute confidence intervals
### Aliases: confint.mitml.testEstimates

### ** Examples

data(studentratings)

fml <- ReadDis ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=500, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# fit regression model
fit <- with(implist, lm(ReadDis ~ 1 + ReadAchiev))
est <- testEstimates(fit)

# calculate confidence intervals
confint(est)

# ... with different confidence levels
confint(est, level=0.90)
confint(est, level=0.999)



