library(FactoMineR)


### Name: HMFA
### Title: Hierarchical Multiple Factor Analysis
### Aliases: HMFA
### Keywords: multivariate

### ** Examples
 
data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)))



