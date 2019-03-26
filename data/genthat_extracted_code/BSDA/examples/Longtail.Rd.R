library(BSDA)


### Name: Longtail
### Title: Long-tailed distributions to illustrate Kruskal Wallis test
### Aliases: Longtail
### Keywords: datasets

### ** Examples


boxplot(score ~ group, data = Longtail, col = heat.colors(3))
kruskal.test(score ~ factor(group), data = Longtail)
anova(lm(score ~ factor(group), data = Longtail))




