library(Rarity)


### Name: corPlot
### Title: Correlation plots
### Aliases: corPlot
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Comparisons of species occurrences estimated from 2 different scales
data(spid.occ)
corPlot(spid.occ, method = "pearson")

# Another example:
# Correlation between different variables measured on the same individuals
data(iris)
corPlot(iris[, 1:4], method = "pearson")
corPlot(iris[, 1:4], method = "spearman")



