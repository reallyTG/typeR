library(svars)


### Name: wild.boot
### Title: Wild bootstrap for IRFs of identified SVARs
### Aliases: wild.boot

### ** Examples

## No test: 
# data contains quarterly observations from 1965Q1 to 2008Q3
# x = output gap
# pi = inflation
# i = interest rates
set.seed(23211)
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.dc(v1)
summary(x1)

# impulse response analysis with confidence bands
# Checking how often theory based impact relations appear
signrest <- list(demand = c(1,1,1), supply = c(-1,1,1), money = c(-1,-1,1))
bb <- wild.boot(x1, rademacher = TRUE, nboot = 500, n.ahead = 30, nc = 1, signrest = signrest)
summary(bb)
plot(bb, lowerq = 0.16, upperq = 0.84)
## End(No test)





