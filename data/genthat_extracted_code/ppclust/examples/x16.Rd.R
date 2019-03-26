library(ppclust)


### Name: x16
### Title: Synthetic data set of two variables forming two clusters
### Aliases: x16
### Keywords: datasets

### ** Examples

data(x16)
x <- x16[,-3]
# descriptive statistics of the variables
summary(x)
# scatter plots for the variable pairs
pairs(x, col=x16$cl, pch=20, cex=2)



