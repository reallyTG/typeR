library(nlshelper)


### Name: anova_nlslist
### Title: Anova for nlsList
### Aliases: anova_nlslist

### ** Examples

chick <- as.data.frame(ChickWeight)

# Fit a simple model with nls
fit0 <- nls(weight ~ a*Time^b, data=chick, start=list(a=10, b=1.1))

# Fit an nlsList model, with a grouping variable (Diet)
fit1 <- nlsList(weight ~ a*Time^b | Diet, data=chick, start=list(a=10, b=1.1))

# Using an F-test, test whether the fit is significantly better when adding
# a grouping variable
anova_nlslist(fit1, fit0)



