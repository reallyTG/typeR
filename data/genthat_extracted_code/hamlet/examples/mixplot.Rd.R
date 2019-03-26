library(hamlet)


### Name: mixplot
### Title: Scatterplot for mixed type data
### Aliases: mixplot
### Keywords: hplot

### ** Examples

data(vcapwide)

mixplot(vcapwide[,c("Group", "PSAWeek4", "PSAWeek10", "PSAWeek14")], marginal=TRUE, pch=16, 
 main="PSA at weeks 4, 10 and 14 per intervention group")



