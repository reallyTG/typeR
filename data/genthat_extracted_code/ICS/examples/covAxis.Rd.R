library(ICS)


### Name: covAxis
### Title: One step Tyler Shape Matrix
### Aliases: covAxis
### Keywords: multivariate

### ** Examples


data(iris)
iris.centered <- sweep(iris[,1:4], 2, colMeans(iris[,1:4]), "-")
iris.paa <- ics(iris.centered, cov, covAxis, stdKurt = FALSE)
summary(iris.paa)
plot(iris.paa, col=as.numeric(iris[,5]))    
mean(iris.paa@gKurt)
emp.align <- iris.paa@gKurt
emp.align

screeplot(iris.paa)
abline(h = 1)






