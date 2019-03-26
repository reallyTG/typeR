library(svars)


### Name: hd
### Title: Historical decomposition for SVAR Models
### Aliases: hd

### ** Examples

## No test: 
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.dc(v1)
x2 <- hd(x1, series = 2)
plot(x2)
## End(No test)




