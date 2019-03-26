library(LaplacesDemon)


### Name: dist.Wishart
### Title: Wishart Distribution
### Aliases: dwishart rwishart
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dwishart(matrix(c(2,-.3,-.3,4),2,2), 3, matrix(c(1,.1,.1,1),2,2))
x <- rwishart(3, matrix(c(1,.1,.1,1),2,2))



