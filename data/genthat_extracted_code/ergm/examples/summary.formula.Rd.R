library(ergm)


### Name: summary.formula
### Title: Calculation of network or graph statistics or other attributes
###   specified on a formula
### Aliases: summary.formula summary
### Keywords: models

### ** Examples


#
# Lets look at the Florentine marriage data
#
data(florentine)
#
# test the summary_formula function
#
summary(flomarriage ~ edges + kstar(2))
m <- as.matrix(flomarriage)
summary(m ~ edges)  # twice as large as it should be
summary(m ~ edges, directed=FALSE) # Now it's correct




