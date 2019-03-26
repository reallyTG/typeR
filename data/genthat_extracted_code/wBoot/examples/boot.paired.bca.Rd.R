library(wBoot)


### Name: boot.paired.bca
### Title: BCa Bootstrap Paired-Samples Test and CI for Two Means
### Aliases: boot.paired.bca

### ** Examples

# The number of inappropriate words out of 10 that were identified in the
# Times New Roman (TNR) and Gigi fonts by each of 25 participants.
data("fonts")
str(fonts)
attach(fonts)

# 90% confidence interval for the difference between the mean number of
# inappropriate words out of 10 identified for the TNR and Gigi fonts.
boot.paired.bca(TNR, GIGI, conf.level = 0.90)

# A right-tailed test with null hypothesis 2, and a 95% (default) lower
# confidence bound for the difference between the mean number of
# inappropriate words out of 10 identified for the TNR and Gigi fonts. 
boot.paired.bca(TNR, GIGI, null.hyp = 2, alternative = "greater")
# Not significant at the 5% level.

# A right-tailed test with null hypothesis 1, and a 95% (default) lower
# confidence bound for the difference between the mean number of
# inappropriate words out of 10 identifiedd for the TNR and Gigi fonts.
boot.paired.bca(TNR, GIGI, null.hyp = 1, alternative = "greater")
# Significant at the 5% level.

detach(fonts)   # clean up



