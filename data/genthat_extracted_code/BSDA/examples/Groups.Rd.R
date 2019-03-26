library(BSDA)


### Name: Groups
### Title: An illustration of analysis of variance
### Aliases: Groups
### Keywords: datasets

### ** Examples


boxplot(response ~ group, data = Groups, col = c("red", "blue", "green"))
anova(lm(response ~ group, data = Groups))





