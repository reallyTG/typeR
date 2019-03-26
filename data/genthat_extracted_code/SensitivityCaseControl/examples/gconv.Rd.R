library(SensitivityCaseControl)


### Name: gconv
### Title: Distribution of the convolution of two discrete random variables
###   that taken on nonnegative integer values.
### Aliases: gconv

### ** Examples

## For Gamma=3, I=3 discordant pairs and the Mantel-Haenszel statistic with d_i=1 for all i
gconv(gconv(c(1/4,3/4),c(1/4,3/4)),c(1/4,3/4))
## returns Pr(Tbar=k|m,F) for k=0,1,2,3)



