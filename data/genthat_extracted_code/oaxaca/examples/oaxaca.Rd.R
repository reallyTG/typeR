library(oaxaca)


### Name: oaxaca
### Title: Blinder-Oaxaca Decomposition
### Aliases: oaxaca summary.oaxaca
### Keywords: decomposition regression linear

### ** Examples

# set random seed
set.seed(03104)

# load data set of Hispanic workers in Chicago
data("chicago")

# perform Blinder-Oaxaca Decomposition:
# explain differences in log real wages across native and foreign-born groups
oaxaca.results.1 <- oaxaca(ln.real.wage ~ age + female + LTHS + some.college + 
                                          college + advanced.degree | foreign.born, 
                           data = chicago, R = 30)

# print the results
print(oaxaca.results.1)

# Next:
# - adjust gender and education dummy variable coefficients to make results
#   invariant to the choice of omitted baseline (reference category)
# - include additional weights for the twofold decomposition that give
#   weights of 0.2 and 0.4 to Group A relative to Group B in the choice
#   of reference coefficients

oaxaca.results.2 <- oaxaca(ln.real.wage ~ age + female + LTHS + some.college + 
                                          college + advanced.degree | foreign.born |
                                          LTHS + some.college + college + advanced.degree,
                           data = chicago, group.weights = c(0.2, 0.4), R = 30)

# plot the results
plot(oaxaca.results.2)




