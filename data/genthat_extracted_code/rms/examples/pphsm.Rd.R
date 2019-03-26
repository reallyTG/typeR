library(rms)


### Name: pphsm
### Title: Parametric Proportional Hazards form of AFT Models
### Aliases: pphsm print.pphsm vcov.pphsm
### Keywords: models survival regression

### ** Examples

set.seed(1)
S <- Surv(runif(100))
x <- runif(100)
dd <- datadist(x); options(datadist='dd')
f <- psm(S ~ x, dist="exponential")
summary(f)        # effects on log(T) scale
f.ph <- pphsm(f)
## Not run: summary(f.ph)     # effects on hazard ratio scale
options(datadist=NULL)



