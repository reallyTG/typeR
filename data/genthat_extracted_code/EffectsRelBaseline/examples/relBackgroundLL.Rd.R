library(EffectsRelBaseline)


### Name: relBackgroundLL
### Title: Log-likelihood ratio of grouped responses being drawn from a
###   background distribution.
### Aliases: relBackgroundLL
### Keywords: multivariate

### ** Examples

# calculate test statistic for one cluster
data(ef)
df<-subset(ef,clustId=='ch26cl3')
relBackgroundLL(df$absResp,df$race,mean(df$absBkg),var(df$absBkg))



