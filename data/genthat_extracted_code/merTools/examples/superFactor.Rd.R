library(merTools)


### Name: superFactor
### Title: Create a factor with unobserved levels
### Aliases: superFactor

### ** Examples

regularFactor <- c("A", "B", "C")
regularFactor <- factor(regularFactor)
levels(regularFactor)
# Now make it super
newLevs <- c("D", "E", "F")
regularFactor <- superFactor(regularFactor, fullLev = newLevs)
levels(regularFactor) # now super



