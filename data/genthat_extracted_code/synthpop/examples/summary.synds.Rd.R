library(synthpop)


### Name: summary.synds
### Title: Synthetic data object summaries
### Aliases: summary.synds print.summary.synds

### ** Examples

s1 <- syn(SD2011[,c("sex","age","edu","marital")], m = 3)
summary(s1)
summary(s1, msel = c(1,3))



