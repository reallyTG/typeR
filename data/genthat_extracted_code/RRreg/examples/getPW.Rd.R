library(RRreg)


### Name: getPW
### Title: Get Misclassification Matrices for RR Models
### Aliases: getPW

### ** Examples

getPW(model = "Warner", p = 2/12)
getPW(model = "UQTknown", p = c(2/12, .3))
getPW(model = "UQTunknown", p = c(2/12, .10/12), group=2, par2=.4)



