library(pscl)


### Name: prussian
### Title: Prussian army horse kick data
### Aliases: prussian
### Keywords: datasets

### ** Examples

data(prussian)
corpP <- glm(y ~ corp, family=poisson,data=prussian)
summary(corpP)



