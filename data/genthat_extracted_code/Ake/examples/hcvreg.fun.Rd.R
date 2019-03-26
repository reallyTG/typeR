library(Ake)


### Name: hcvreg.fun
### Title: Cross-validation function for bandwidth selection in regresssion
### Aliases: hcvreg.fun hcvreg.fun.default
### Keywords: smooth nonparametric

### ** Examples

## Data can be simulated data or real data
## We use real data 
## and then compute the cross validation. 
data(milk)
x=milk$week
y=milk$yield
hcvreg.fun(x,y,"discrete",ker="triang",a=1)




