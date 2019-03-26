library(EWGoF)


### Name: LRI.test
### Title: GoF tests based on the Laplace transform, the mean residual life
###   and the integrated distribution function for the Exponential
###   distribution
### Aliases: LRI.test
### Keywords: Laplace transform integrated distribution function mean
###   residual life Klar Henze

### ** Examples

x <- rlnorm(50,0.3)

#Apply the Baringhaus-Henze test
LRI.test(x,type="BH")

# Apply the test of Henze
LRI.test(x,type="He")


# Apply the test of Klar
LRI.test(x,type="Kl")


# Apply the test of Barighaus based on the integrated distribution function
LRI.test(x,type="BHC")




