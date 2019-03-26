library(sEparaTe)


### Name: lrt2d_svc
### Title: Unbiased modified likelihood ratio test for simple separability
###   of a variance-covariance matrix.
### Aliases: lrt2d_svc

### ** Examples

#To reduce the time elapsed, this example uses only 160 simulations.
#8000 simulations or more are recommended in an example like this.
output <- lrt2d_svc(value2d~Id1+Id2, rep = "K", data = data2d, n.simul = 160)
output




