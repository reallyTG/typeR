library(bhm)


### Name: bhm
### Title: Fitting Biomarker Threshold Models
### Aliases: bhm bhm.default bhm.formula bhmFit bhmGibbs prolikFit thm.fit
###   thm.lik x.cdf
### Keywords: Biomarker interaction Predictive effect Prognostic effect

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
## fit a biomarker threshold survival model with one single cut point

fit = bhm(Surv(tm, status)~ki67+trt+age, interaction = TRUE, B=5, R=10)


## here B=5 and R=10 is used for test run. In general, B > 500 and R > 2000 is
## recommend for the analysis of biomarker variable. To fit a model with 
## two cut points, use: 
##
##     fit = bhm(Surv(tm, status)~bmk+trt+age, B = 500,  R = 2000, c.n = 2)
##
## To print the output, use
##
       print(fit)
##



