library(BSDA)


### Name: Appendec
### Title: Median costs of appendectomies at three different types of North
###   Carolina hospitals
### Aliases: Appendec
### Keywords: datasets

### ** Examples


boxplot(cost ~ region, data = Appendec, col = c("red", "blue", "cyan"))
anova(lm(cost ~ region, data = Appendec))




