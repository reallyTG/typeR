library(RSurveillance)


### Name: sep.var.se
### Title: Population sensitivity for varying unit sensitivity
### Aliases: sep.var.se
### Keywords: methods

### ** Examples

# examples of sep.var.se - checked
sens<- c(rep(0.9, 50), rep(0.95, 100))
sep.var.se(NA, sens, 0.01)
sep.var.se(se=sens, pstar=0.01)
sep.var.se(N=500, sens, 0.01)
sep.var.se(NA, runif(150, 0.95, 0.99), 0.02)
sep.var.se(500, runif(150, 0.95, 0.99), 0.02)



