library(psychotools)


### Name: ConspiracistBeliefs2016
### Title: Generic Conspiracist Beliefs Scale (2016 Data)
### Aliases: ConspiracistBeliefs2016
### Keywords: datasets

### ** Examples

## overview
data("ConspiracistBeliefs2016", package = "psychotools")
str(ConspiracistBeliefs2016)

## response
plot(itemresp(ConspiracistBeliefs2016$resp))
## covariates
summary(ConspiracistBeliefs2016[, -1])



