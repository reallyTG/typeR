library(ccfa)


### Name: cfa2
### Title: cfa2
### Aliases: cfa2

### ** Examples

#' data(igm)
tvals <- seq(10,12,length.out=5)
yvals <- seq(quantile(igm$lcfincome, .05), quantile(igm$lcfincome, .95), length.out=50)

## obtain counterfactual results using quantile regression with
## no covariates and adjusting for education
cfa2(lcfincome ~ lfincome, tvals, yvals, igm, method1="qr", xformla2=~HEDUC,
method2="qr", se=FALSE, tau1=seq(.1,.9,.1), tau2=seq(.1,.9,.1))




