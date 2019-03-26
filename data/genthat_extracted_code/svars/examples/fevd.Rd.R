library(svars)


### Name: fevd
### Title: Forecast error variance decomposition for SVAR Models
### Aliases: fevd fevd.svars

### ** Examples

## No test: 
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.dc(v1)
x2 <- fevd(x1, n.ahead = 30)
plot(x2)
## End(No test)




