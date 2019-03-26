library(s20x)


### Name: summary2way
### Title: Two-way Analysis of Variance Summary
### Aliases: summary2way
### Keywords: models

### ** Examples


##Arousal data:
data(arousal.df)
arousal.fit = lm(arousal ~ gender * picture, data = arousal.df)
summary2way(arousal.fit)




