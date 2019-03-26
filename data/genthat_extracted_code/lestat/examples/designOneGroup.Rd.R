library(lestat)


### Name: designOneGroup
### Title: Create a Design Matrix for One Group of Observations
### Aliases: designOneGroup
### Keywords: One-sample t test

### ** Examples

data <- simulate(normal(4, log(1.3)), 9)
design <- designOneGroup(9)
posterior <- linearmodel(data, design)
credibilityinterval(marginal(posterior, 1))



