library(muhaz)


### Name: pehaz
### Title: Estimates piecewise exponential hazard function from
###   right-censored data.
### Aliases: pehaz
### Keywords: survival

### ** Examples

data(ovarian, package="survival")
attach(ovarian)
fit <- pehaz(futime, fustat)
plot(fit)



