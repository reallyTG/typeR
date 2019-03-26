library(wPerm)


### Name: perm.ind.spread
### Title: Permutation Test for Difference in Spread
### Aliases: perm.ind.spread

### ** Examples

# Manufacturers use the Elmendorf tear test to evaluate material
# strength for various manufactured products. 
#
# Elmendorf tear strength, in grams, of two different vinyl floor
# coverings, Brand A and Brand B.
data("elmendorf")
str(elmendorf)
# Note that the data are stacked.

# Permutation test to decide whether there is a difference in spread of
# tear strength for Brand A and Brand B vinyl floor coverings, using the
# standard deviation as the spread parameter.
attach(elmendorf)
perm.ind.spread(STRENGTH, BRAND, sd)

detach(elmendorf)  # clean up

# Final-exam scores (out of 40 possible) for two groups of algebra
# students. One group, called the control group, was taught the usual
# algebra course; the other group, called the experimental group, was
# taught by a new teaching method.
data("control")
str(control)
data("experimental")
str(experimental)

# Permutation test to decide whether the new teaching method reduces
# variation in final-exam scores, using the variance as the spread
# parameter.
perm.ind.spread(control, experimental, var, stacked = FALSE,
variable = "Score", alternative = "greater")



