library(polspline)


### Name: summary.polyclass
### Title: Polyclass: polychotomous regression and multiple classification
### Aliases: summary.polyclass print.polyclass
### Keywords: smooth nonlinear

### ** Examples

data(iris)
fit.iris <- polyclass(iris[,5], iris[,1:4])
summary(fit.iris)



