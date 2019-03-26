library(msma)


### Name: ncompsearch
### Title: Search for Number of Components
### Aliases: ncompsearch print.ncompsearch plot.ncompsearch

### ** Examples

##### data #####
tmpdata = simdata(n = 50, rho = 0.8, Yps = c(10, 12, 15), Xps = 20, seed=1)
X = tmpdata$X; Y = tmpdata$Y 

##### number of components search #####
ncomp1 = ncompsearch(X, Y, comps = c(1, 5, 10*(1:5)), nfold=5)
plot(ncomp1)




