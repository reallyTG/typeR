library(BSDA)


### Name: Independent
### Title: Illustrates a comparison problem for long-tailed distributions
### Aliases: Independent
### Keywords: datasets

### ** Examples


qqnorm(Independent$score[Independent$group=="A"])
qqline(Independent$score[Independent$group=="A"])
qqnorm(Independent$score[Independent$group=="B"])
qqline(Independent$score[Independent$group=="B"])
boxplot(score ~ group, data = Independent, col = "blue")
wilcox.test(score ~ group, data = Independent)




