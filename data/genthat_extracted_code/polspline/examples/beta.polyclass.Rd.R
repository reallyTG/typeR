library(polspline)


### Name: beta.polyclass
### Title: Polyclass: polychotomous regression and multiple classification
### Aliases: beta.polyclass
### Keywords: smooth nonlinear

### ** Examples

data(iris)
fit.iris <- polyclass(iris[,5], iris[,1:4])
beta.polyclass(fit.iris)



