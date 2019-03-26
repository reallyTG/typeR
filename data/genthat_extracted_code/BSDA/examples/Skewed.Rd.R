library(BSDA)


### Name: Skewed
### Title: Illustrates the Wilcoxon Rank Sum test
### Aliases: Skewed
### Keywords: datasets

### ** Examples


boxplot(Skewed$C1, Skewed$C2, col = c("pink", "lightblue"))
wilcox.test(Skewed$C1, Skewed$C2)




