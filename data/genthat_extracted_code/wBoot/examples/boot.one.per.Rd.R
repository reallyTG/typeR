library(wBoot)


### Name: boot.one.per
### Title: Percentile Bootstrap One-Sample Test and CI
### Aliases: boot.one.per

### ** Examples

# Losses ($) for a sample of 25 pickpocket offenses.
data("loss")
str(loss)

# 95% (default) confidence interval for the mean loss of all pickpocket offenses.
boot.one.per(loss, mean)

# 95% (default) lower confidence bound for the mean loss of all pickpocket
# offenses, and a right-tailed test with null hypothesis 500.
boot.one.per(loss, mean, null.hyp = 500, alternative = "greater")

# 90% two-sided confidence interval for the mean loss of all pickpocket
# offenses, and a right-tailed test with null hypothesis 500.
boot.one.per(loss, mean, null.hyp = 500, alternative = "greater", conf.level = 0.90,
type = "two-sided")

# 95% (default) confidence interval for the standard deviation of losses of all
# pickpocket offenses.
boot.one.per(loss, sd)
# See the preceeding warning!

# 95% (default) confidence interval for the 20% trimmed mean.
twen.tm <- function(x) mean(x, trim = 0.20)
boot.one.per(loss, twen.tm)



