library(wBoot)


### Name: boot.cond.mean.per
### Title: Percentile Bootstrap Conditional Mean CI in Simple Linear
###   Regression
### Aliases: boot.cond.mean.per

### ** Examples

# Lot size, house size, and value for a sample of homes in a particular area.
data("homes")
str(homes)
attach(homes)

# 95% (default) CI for the conditional mean value of a 3000 sq.ft. home,
# with 999 bootstrap replications.
boot.cond.mean.per(HOUSE.SIZE, VALUE, 3000, R = 999)

# 90% CI for the conditional mean value of a 3000 sq.ft. home, with
# 999 bootstrap replications.
boot.cond.mean.per(HOUSE.SIZE, VALUE, 3000, conf.level = 0.90, R = 999)

detach(homes) # clean up



