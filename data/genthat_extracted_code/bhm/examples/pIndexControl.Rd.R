library(bhm)


### Name: pIndexControl
### Title: Auxiliary function for pIndex fitting
### Aliases: pIndexControl
### Keywords: control

### ** Examples

## To calculate the probability index for a biomarker with conditional empirical likelihood method, 
## and the corresponding 90 percent CI using Bootstrap method with 10000 bootstrap sample

ctl = pIndexControl(method = 'Elc', ci = 'Bootstrap', B = 10000, alpha = 0.1)

##
## then fit the following model
##
#  fit = pIndex(y~x1 + x2, family = 'surv', control = ctl)
##



