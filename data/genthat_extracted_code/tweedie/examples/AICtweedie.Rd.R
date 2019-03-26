library(tweedie)


### Name: AICtweedie
### Title: Tweedie Distributions
### Aliases: AICtweedie
### Keywords: models

### ** Examples

library(statmod) # Needed to use  tweedie  family object

### Generate some fictitious data
test.data <- rgamma(n=200, scale=1, shape=1)

### Fit a Tweedie glm and find the AIC
m1 <- glm( test.data~1, family=tweedie(link.power=0, var.power=2) )

### A Tweedie glm with p=2 is equivalent to a gamma glm:
m2 <- glm( test.data~1, family=Gamma(link=log))

### The models are equivalent, so the AIC shoud be the same:
AICtweedie(m1)
AIC(m2)




