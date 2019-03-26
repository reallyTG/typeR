library(pastecs)


### Name: pgleissberg
### Title: Gleissberg distribution probability
### Aliases: pgleissberg
### Keywords: distribution

### ** Examples

# Until n=50, the exact probability is returned
pgleissberg(20, 10, lower.tail=TRUE, two.tailed=FALSE)
# For higher n values, it is approximated by a normal distribution
pgleissberg(60, 33, lower.tail=TRUE, two.tailed=FALSE)



