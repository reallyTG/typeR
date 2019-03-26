library(RoughSets)


### Name: RI.laplace
### Title: Quality indicators of RST decision rules
### Aliases: RI.confidence RI.laplace RI.lift RI.support

### ** Examples

###########################################################
## Example : Filtering a set of decision rules
###########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

rules <- RI.LEM2Rules.RST(hiring.data)

rules

# a vector of rules' Laplace estimate of the confidence:
RI.laplace(rules)
# a vector of rules' confidence values:
RI.confidence(rules)

# subsetting a set of rules:
rules[RI.support(rules) > 0.2]
rules[RI.lift(rules) < 1.5]



