library(BSDA)


### Name: Median
### Title: Illustrates test of equality of medians with the Kruskal Wallis
###   test
### Aliases: Median
### Keywords: datasets

### ** Examples


boxplot(value ~ sample, data = Median, col = rainbow(3))
anova(lm(value ~ sample, data = Median))
kruskal.test(value ~ factor(sample), data = Median)




