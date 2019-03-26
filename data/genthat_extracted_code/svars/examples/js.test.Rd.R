library(svars)


### Name: js.test
### Title: Chi-square test for joint hypotheses
### Aliases: js.test

### ** Examples

## No test: 
# data contains quarterly observations from 1965Q1 to 2008Q3
# x = output gap
# pi = inflation
# i = interest rates
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.dc(v1)

# Bootstrapping of SVAR
bb <- wild.boot(x1, nboot = 1000, n.ahead = 30)

# Testing the hypothesis of a lower triangular matrix as
# relation between structural and reduced form errors
R <- rbind(c(0,0,0,1,0,0,0,0,0), c(0,0,0,0,0,0,1,0,0),
           c(0,0,0,0,0,0,0,1,0))
c.test <- js.test(bb, R)
summary(c.test)
## End(No test)




