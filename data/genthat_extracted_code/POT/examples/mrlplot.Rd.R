library(POT)


### Name: mrlplot
### Title: Threshold Selection: The Empirical Mean Residual Life Plot
### Aliases: mrlplot
### Keywords: hplot

### ** Examples

data(ardieres)
ardieres <- clust(ardieres, 4, 10 / 365, clust.max = TRUE)
flows <- ardieres[, "obs"]
mrlplot(flows)



