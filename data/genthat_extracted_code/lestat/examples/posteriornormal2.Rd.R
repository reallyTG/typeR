library(lestat)


### Name: posteriornormal2
### Title: Compute a Posterior Distribution for Parameters of Two Normal
###   Distributions
### Aliases: posteriornormal2

### ** Examples

data1 <- simulate(normal(3.3, log(2)), 9)
data2 <- simulate(normal(5.7, log(2)), 4)
posteriornormal2(data1, data2)
marginal(linearmodel(c(data1, data2), 
designTwoGroups(length(data1), length(data2))), 2:3) #Gives same result



