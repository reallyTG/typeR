library(muhaz)


### Name: muhaz
### Title: Estimate hazard function from right-censored data.
### Aliases: muhaz
### Keywords: survival smooth

### ** Examples

# to compute a locally optimal estimate
data(ovarian, package="survival")
attach(ovarian)
fit1 <- muhaz(futime, fustat)
plot(fit1)
summary(fit1)
# to compute a globally optimal estimate
fit2 <- muhaz(futime, fustat, bw.method="g")
# to compute an estimate with global bandwidth set to 5
fit3 <- muhaz(futime, fustat, bw.method="g", bw.grid=5)



