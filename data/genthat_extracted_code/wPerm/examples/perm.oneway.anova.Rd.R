library(wPerm)


### Name: perm.oneway.anova
### Title: Permutation One-Way ANOVA Test
### Aliases: perm.oneway.anova

### ** Examples

# Last year's energy consumptions, to the nearest 10 million BTU, for
# independent random samples of households in the four U.S. regions.
data("energy")
str(energy)
attach(energy)

# Permutation one-way ANOVA to decide whether the energy distributions
# have systematically larger values in some U.S. regions than in others.
# Regions ordered to Northeast, Midwest, South, and West; 999 replications.
perm.oneway.anova(ENERGY, REGION, ford = c(2,1,3,4), R = 999)

detach(energy)  # clean up



