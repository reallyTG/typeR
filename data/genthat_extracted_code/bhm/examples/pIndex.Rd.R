library(bhm)


### Name: pIndex
### Title: Probability Index for Survival Time Difference
### Aliases: pIndex pIndex.default pIndex.formula pIndexFit pIndexLocal
###   pIndexThreshold
### Keywords: Biomarker interaction Probability index

### ** Examples

##
## Generate a random data set
n = 300
b = c(0.5, 1, 1.5)
data = surv.gendat(n, c0 = 0.40, beta = b)
age = runif(n, 0, 1)*100
tm = data[, 1]
status = data[, 2]
trt = data[, 3]
ki67 = data[, 4]
#
### No run
# 
# fit = pIndex(Surv(tm, status) ~ trt + ki67) 
#



