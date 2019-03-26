library(FactoMineR)


### Name: plot.HMFA
### Title: Draw the Hierarchical Multiple Factor Analysis (HMFA) graphs
### Aliases: plot.HMFA
### Keywords: dplot

### ** Examples

data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)), graph = FALSE)
plot(res.hmfa, invisible="quali")
plot(res.hmfa, invisible="ind")



