library(lestat)


### Name: designTwoGroups
### Title: Create a Design Matrix for Two Groups of Observations
### Aliases: designTwoGroups
### Keywords: Two-sample t test

### ** Examples

data1 <- simulate(normal(3, log(2)), 7)
data2 <- simulate(normal(5, log(2)), 9)
design <- designTwoGroups(7,9)
posterior <- linearmodel(c(data1, data2), design)
credibilityinterval(marginal(posterior, 1))



