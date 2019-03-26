library(pscl)


### Name: iraqVote
### Title: U.S. Senate vote on the use of force against Iraq, 2002.
### Aliases: iraqVote
### Keywords: datasets

### ** Examples

data(iraqVote)
## probit model
glm1 <- glm(y ~ gorevote + rep,
            data=iraqVote,
            family=binomial(link=probit))



