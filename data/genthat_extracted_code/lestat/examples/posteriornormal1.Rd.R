library(lestat)


### Name: posteriornormal1
### Title: Compute the Posterior Distribution for Parameters of One Normal
###   Distribution
### Aliases: posteriornormal1

### ** Examples

data <- simulate(normal(3.3, log(2)), 9)
posteriornormal1(data)
linearmodel(data, designOneGroup(length(data))) #Gives same result



