library(MASS)


### Name: Insurance
### Title: Numbers of Car Insurance claims
### Aliases: Insurance
### Keywords: datasets

### ** Examples

## main-effects fit as Poisson GLM with offset
glm(Claims ~ District + Group + Age + offset(log(Holders)),
    data = Insurance, family = poisson)

# same via loglm
loglm(Claims ~ District + Group + Age + offset(log(Holders)),
      data = Insurance)



