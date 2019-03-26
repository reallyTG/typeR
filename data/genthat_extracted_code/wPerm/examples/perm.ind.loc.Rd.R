library(wPerm)


### Name: perm.ind.loc
### Title: Independent-Samples Permutation Test for Difference in Location
### Aliases: perm.ind.loc

### ** Examples

# Annual salaries, in thousands of dollars, for independent samples of
# faculty in private and public institutions.
data("salary")
str(salary)
attach(salary)
# Note that the data are stacked.

# Independent-samples permutation test to decide whether there is a
# difference in location for salaries of faculty in private and public
# institutions, using the mean as the location parameter.
perm.ind.loc(SALARY, TYPE, mean)

# Independent-samples permutation test to decide whether faculty in private
# institutions have systematically larger salaries than those in public
# institutions, using the 20% trimmed mean as the location parameter.
tr20.mean <- function(x) mean(x, trim = 0.20)
perm.ind.loc(SALARY, TYPE, tr20.mean, alternative = "greater")

detach(salary)  # clean up.



