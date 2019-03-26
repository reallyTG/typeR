library(PBImisc)


### Name: YXZ
### Title: Artificial dataset which shows the differences between tests
###   type I and III (sequential vs. marginal)
### Aliases: YXZ
### Keywords: YXZ

### ** Examples

attach(YXZ)
summary(lm(Y~X+Z))
anova(lm(Y~Z+X))
anova(lm(Y~X))
anova(lm(Y~Z))



