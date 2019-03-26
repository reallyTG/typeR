library(polspline)


### Name: plot.polyclass
### Title: Polyclass: polychotomous regression and multiple classification
### Aliases: plot.polyclass
### Keywords: smooth nonlinear

### ** Examples

data(iris)
fit.iris <- polyclass(iris[,5], iris[,1:4])
plot(fit.iris, iris[64,1:4], which=c(3,4), data=2, what=1) 
plot(fit.iris,iris[64,1:4], which=c(3,4), what=5) 
plot(fit.iris,iris[64,1:4], which=4, what=7) 



