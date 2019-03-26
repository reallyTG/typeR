library(gpr)


### Name: minimize
### Title: Minimize function for differentiable multivariate functions.
### Aliases: minimize 'minimize, array, string, integer, string, array,
###   array'

### ** Examples

loghyper= array(c(-1,-1,-1), dim=c(3,1))
covfunc ="covSum,covSEiso,covNoise"
x= array(c(1,1,0,0), dim=c(2,2))
y= array(c(1,0), dim=c(2,1))
loghyper = minimize(loghyper, 'gpr', 10, covfunc, x, y)
loghyper



