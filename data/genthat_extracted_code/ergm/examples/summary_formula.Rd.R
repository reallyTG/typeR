library(ergm)


### Name: summary_formula
### Title: Dispatching a summary function based on the class of the LHS of
###   a formula.
### Aliases: summary_formula summary_formula.ergm
###   summary_formula.network.list summary_formula.network
###   summary_formula.matrix summary_formula.default
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




