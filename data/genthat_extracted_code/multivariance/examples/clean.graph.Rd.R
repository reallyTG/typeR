library(multivariance)


### Name: clean.graph
### Title: cleanup dependence structure graph
### Aliases: clean.graph

### ** Examples


N = 200
y = coins(N,2)
x = cbind(y,y,y)
ds = dependence.structure(x)
plot(clean.graph(ds$graph))



