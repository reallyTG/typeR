library(BHH2)


### Name: anovaPlot
### Title: Graphical Anova
### Aliases: anovaPlot
### Keywords: design hplot regression

### ** Examples

library(BHH2)
data(heads.data)
heads.data$periods <- factor(heads.data$periods)
heads.data$heads <- factor(heads.data$heads)

heads.aov <- aov(resp~periods+heads,data=heads.data)
anovaPlot(heads.aov)

anovaPlot(heads.aov,labels=TRUE,faclab=TRUE)




