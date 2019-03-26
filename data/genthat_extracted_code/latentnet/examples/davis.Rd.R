library(latentnet)


### Name: davis
### Title: Southern Women Data Set (Davis) as a bipartite "network" object
### Aliases: davis
### Keywords: data

### ** Examples


## No test: 
data(davis)
# Fit a 2D 2-cluster fit and plot.
davis.fit<-ergmm(davis~euclidean(d=2,G=2)+rsociality)
plot(davis.fit,pie=TRUE,rand.eff="sociality")
## End(No test)




