library(bhm)


### Name: resboot
### Title: Rresidual Bootstrap Test (RBT) for treatment-biomarker
###   interaction
### Aliases: resboot resboot.default resboot.formula
### Keywords: Biomarker interaction Predictive effect Residual bootstrap

### ** Examples

##
## Generate a random data set
n = 300
b = c(0.5, 1, 1.5)
data = surv.gendat(n, c0 = 0.40, beta = b)
tm = data[, 1]
status = data[, 2]
trt = data[, 3]
ki67 = data[, 4]
#
### No run
# 
# fit = resboot(Surv(tm, status) ~ trt + ki67) 
#



