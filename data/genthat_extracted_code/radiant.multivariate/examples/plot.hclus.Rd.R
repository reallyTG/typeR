library(radiant.multivariate)


### Name: plot.hclus
### Title: Plot method for the hclus function
### Aliases: plot.hclus

### ** Examples

result <- hclus(shopping, vars = c("v1:v6"))
plot(result, plots = c("change", "scree"), cutoff = .05)
plot(result, plots = "dendro", cutoff = 0)




