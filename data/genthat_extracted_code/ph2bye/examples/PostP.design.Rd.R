library(ph2bye)


### Name: PostP.design
### Title: The stopping boundaries based on the posterior probability
###   criterion
### Aliases: PostP.design

### ** Examples

## Using vague prior Unif(0,1)
PostP.design(type = "futility", nmax=100, a=1, b=1, p0=0.3, theta=0.05)
PostP.design(type = "efficacy", nmax=100, a=1, b=1, p0=0.3, theta=0.9)
## Or using Jeffery prior with Beta(0.5,0.5)
PostP.design(type = "futility", nmax=100, a=0.5, b=0.5, p0=0.3, theta=0.05)
PostP.design(type = "efficacy", nmax=100, a=0.5, b=0.5, p0=0.3, theta=0.9)



