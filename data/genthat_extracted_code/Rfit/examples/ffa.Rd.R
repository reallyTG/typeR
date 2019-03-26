library(Rfit)


### Name: ffa
### Title: Free Fatty Acid Data
### Aliases: ffa
### Keywords: datasets

### ** Examples

data(ffa)
summary(rfit(ffa~age+weight+skin,data=ffa))  #using the default (Wilcoxon scores)
summary(rfit(ffa~age+weight+skin,data=ffa,scores=bentscores1))



