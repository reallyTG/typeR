library(wBoot)


### Name: boot.slope.per
### Title: Percentile Bootstrap Test and CI for the Slope of a Population
###   Regression Line in Simple Linear Regression
### Aliases: boot.slope.per

### ** Examples

# Lot size, house size, and value for a sample of homes in a particular area.
data("homes")
str(homes)
attach(homes)

# 95% (default) lower confidence bound for the slope of the population regression
# line relating lot size and value, a right-tailed test with null hypothesis 0,
# and 999 bootstrap replications.
boot.slope.per(LOT.SIZE, VALUE, null.hyp = 0, alternative = "greater", R = 999)
# See the preceding warning!

# 90% two-sided confidence interval for the slope of the population regression line
# relating house size and value, a right-tailed test with null hypothesis 0, and
# 999 bootstrap replications.
boot.slope.per(HOUSE.SIZE, VALUE, null.hyp = 0, alternative = "greater",
conf.level = 0.90, type = "two-sided", R = 999)

detach(homes) # clean up



