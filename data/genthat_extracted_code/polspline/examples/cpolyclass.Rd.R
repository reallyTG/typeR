library(polspline)


### Name: cpolyclass
### Title: Polyclass: polychotomous regression and multiple classification
### Aliases: cpolyclass ppolyclass rpolyclass
### Keywords: smooth nonlinear

### ** Examples

data(iris)
fit.iris <- polyclass(iris[,5], iris[,1:4])
class.iris <- cpolyclass(iris[,1:4], fit.iris)
table(class.iris, iris[,5])
prob.setosa <- ppolyclass(1, iris[,1:4], fit.iris)
prob.correct <- ppolyclass(iris[,5], iris[,1:4], fit.iris) 
rpolyclass(100, iris[64,1:4], fit.iris)



