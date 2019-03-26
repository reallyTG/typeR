library(wBoot)


### Name: boot.cor.per
### Title: Percentile Bootstrap Correlation Test and CI
### Aliases: boot.cor.per

### ** Examples

# NOTE: See the preceding warning!

# Lot size, house size, and value for a sample of homes in a particular area.
data("homes")
str(homes)
attach(homes)

# 95% (default) confidence interval for the correlation between lot size and value.
boot.cor.per(LOT.SIZE, VALUE)

# 95% (default) lower confidence bound for the correlation between house size
# and value, and a right-tailed test with null hypothesis 0.5.
boot.cor.per(HOUSE.SIZE, VALUE, null.hyp = 0.5, alternative = "greater")

# 90% two-sided confidence interval for the correlation between house size and value,
# a right-tailed test with null hypothesis 0.5, and 999 bootstrap replications.
boot.cor.per(HOUSE.SIZE, VALUE, null.hyp = 0.5, alternative = "greater",
conf.level = 0.90, type = "two-sided", R = 999)

detach(homes) # clean up



