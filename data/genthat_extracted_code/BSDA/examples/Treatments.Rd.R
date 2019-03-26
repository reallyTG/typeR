library(BSDA)


### Name: Treatments
### Title: Illustrates analysis of variance for three treatment groups
### Aliases: Treatments
### Keywords: datasets

### ** Examples


boxplot(score ~ group, data = Treatments, col = "violet")
summary(aov(score ~ group, data = Treatments))
summary(lm(score ~ group, data = Treatments))
anova(lm(score ~ group, data = Treatments))




