library(wPerm)


### Name: perm.paired.loc
### Title: Paired-Sample Permutation Test for Difference in Location
### Aliases: perm.paired.loc

### ** Examples

# Ages of a sample of 10 heterosexual spouses.
data("spouse.ages")
str(spouse.ages)
attach(spouse.ages)

# Paired-sample permutation test to decide whether there is a difference
# in location for age distributions of married men and married women,
# using the mean as the location parameter. Variable named "Age".
perm.paired.loc(HUSBAND, WIFE, mean, "Age")

# Paired-sample permutation test to decide whether married men have
# systematically greater ages than married women, using the 10% trimmed
# mean as the location parameter.
tr10.mean <- function(x) mean(x, trim = 0.10)
perm.paired.loc(HUSBAND, WIFE, tr10.mean, alternative = "greater")

detach(spouse.ages)  # clean up.



