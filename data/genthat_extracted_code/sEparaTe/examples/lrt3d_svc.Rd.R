library(sEparaTe)


### Name: lrt3d_svc
### Title: An unbiased modified likelihood ratio test for double
###   separability of a variance-covariance structure.
### Aliases: lrt3d_svc

### ** Examples

#To reduce the time elapsed, this example uses only 160 simulations.
#8000 simulations or more are recommended in an example like this.
output <- lrt3d_svc(value3d~Id3+Id4+Id5, rep = "K", data = data3d, n.simul = 160)
output




