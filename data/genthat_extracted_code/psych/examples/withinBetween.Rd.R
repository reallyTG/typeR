library(psych)


### Name: withinBetween
### Title: An example of the distinction between within group and between
###   group correlations
### Aliases: withinBetween
### Keywords: datasets

### ** Examples

data(withinBetween)
pairs.panels(withinBetween,bg=c("red","blue","white","black")[withinBetween[,1]],
     pch=21,ellipses=FALSE,lm=TRUE)
stats <- statsBy(withinBetween,'Group')
print(stats,short=FALSE)



