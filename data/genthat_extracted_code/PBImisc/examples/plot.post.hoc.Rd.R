library(PBImisc)


### Name: Plot results from post hoc testing
### Title: A function for visual representation of pairwise testing (both
###   for pairwise.t.test and pairwise.wilcox.test)
### Aliases: plotPairwiseTests

### ** Examples

data(iris)
tmp1 <- pairwise.wilcox.test(iris$Sepal.Width, iris$Species)
tmp2 <- tapply(iris$Sepal.Width, iris$Species, median, na.rm=TRUE)
plotPairwiseTests(tmp1$p.value, tmp2, alpha=0.001)




