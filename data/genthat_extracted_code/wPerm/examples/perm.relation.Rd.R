library(wPerm)


### Name: perm.relation
### Title: Permutation Test for a Relationship
### Aliases: perm.relation

### ** Examples

# Prices, in euros, of a 50cl bottle of water and distances, in meters,
# of convenience stores from the Contemporary Art Museum in El Raval,
# Barcelona.
data("water")
str(water)
attach(water)

# Permutation test to decide whether a negative relationship exists
# between price and distance, using Pearson's r as the test statistic.
perm.relation(PRICE, DISTANCE, alternative = "less")

# Permutation test to decide whether a negative relationship exists
# between price and distance, using Kendall's tau as the test statistic.
perm.relation(PRICE, DISTANCE, "kendall", "less")

# Permutation test to decide whether a negative relationship exists
# between price and distance, using Spearman's rho as the test statistic.
perm.relation(PRICE, DISTANCE, "spearman", "less")

detach(water)  # clean up.



