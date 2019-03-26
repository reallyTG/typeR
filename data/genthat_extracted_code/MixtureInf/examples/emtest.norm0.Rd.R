library(MixtureInf)


### Name: emtest.norm0
### Title: test the order of a mixture of normals with equal and known
###   variance
### Aliases: emtest.norm0
### Keywords: htest

### ** Examples

#generate a random sample from a 2 component noraml mixture with equal variance, 
#conduct homogeneity test by the EM-test.
x <- rmix.norm(200,c(0.3,0.7),c(-1,2),c(2,2))
emtest.norm0(x,var=4)



