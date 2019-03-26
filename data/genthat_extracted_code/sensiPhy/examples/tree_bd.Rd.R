library(sensiPhy)


### Name: tree_bd
### Title: Phylogenetic uncertainty - net diversification rate
### Aliases: tree_bd

### ** Examples

data("primates")
# To estimate diversification rate with Magallon and Sanderson method:
fit <- tree_bd(phy = primates.phy, n.tree = 30, method = "ms")
summary(fit)
sensi_plot(fit)
# To estimate speciation rate Kendall-Moran method
fit <- tree_bd(phy = primates.phy, n.tree = 30, method = "km")
summary(fit)
sensi_plot(fit)



