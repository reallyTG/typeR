library(ICV)


### Name: h_isemixnorm
### Title: The ISE-optimal bandwidth in the case when the true density is
###   the specified mixture of normal distributions.
### Aliases: h_isemixnorm

### ** Examples

# ISE optimal bandwidth for a random sample of size n=100 generated from a normal mixture defined by
# w=c(1/5,1/5,3/5), mu=(0,1/2,13/12), sdev=c(1,2/3,5/9).
# This corresponds to the skewed unimodal density of Marron and Wand (1992).
h_isemixnorm(rnorm(100),c(1/5,1/5,3/5),c(0,1/2,13/12),c(1,2/3,5/9))



