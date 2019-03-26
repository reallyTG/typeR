library(svars)


### Name: irf
### Title: Impulse Response Functions for SVAR Models
### Aliases: irf irf.svars

### ** Examples

## No test: 
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.ngml(v1)
x2 <- irf(x1, n.ahead = 20)
plot(x2)
## End(No test)




