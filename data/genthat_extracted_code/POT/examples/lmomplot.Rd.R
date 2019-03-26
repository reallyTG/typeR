library(POT)


### Name: lmomplot
### Title: Threshold Selection: The L-moments Plot
### Aliases: lmomplot
### Keywords: hplot

### ** Examples

data(ardieres)
ardieres <- clust(ardieres, 4, 10 / 365, clust.max = TRUE)
flows <- ardieres[, "obs"]
lmomplot(flows, identify = FALSE)



