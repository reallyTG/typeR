library(LaplacesDemon)


### Name: dist.Inverse.Wishart
### Title: Inverse Wishart Distribution
### Aliases: dinvwishart rinvwishart
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dinvwishart(matrix(c(2,-.3,-.3,4),2,2), 3, matrix(c(1,.1,.1,1),2,2))
x <- rinvwishart(3, matrix(c(1,.1,.1,1),2,2))



