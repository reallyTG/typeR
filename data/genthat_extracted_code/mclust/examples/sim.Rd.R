library(mclust)


### Name: sim
### Title: Simulate from Parameterized MVN Mixture Models
### Aliases: sim
### Keywords: cluster

### ** Examples

irisBIC <- mclustBIC(iris[,-5])
irisModel <- mclustModel(iris[,-5], irisBIC)
names(irisModel)
irisSim <- sim(modelName = irisModel$modelName, 
               parameters = irisModel$parameters, 
               n = nrow(iris))

## Not run: 
##D   do.call("sim", irisModel) # alternative call
## End(Not run)

par(pty = "s", mfrow = c(1,2))

dimnames(irisSim) <- list(NULL, c("dummy", (dimnames(iris)[[2]])[-5]))

dimens <- c(1,2)
lim1 <- apply(iris[,dimens],2,range)
lim2 <- apply(irisSim[,dimens+1],2,range)
lims <- apply(rbind(lim1,lim2),2,range)
xlim <- lims[,1]
ylim <- lims[,2]

coordProj(iris[,-5], parameters=irisModel$parameters, 
          classification=map(irisModel$z), 
          dimens=dimens, xlim=xlim, ylim=ylim)

coordProj(iris[,-5], parameters=irisModel$parameters, 
          classification=map(irisModel$z), truth = irisSim[,-1],
          dimens=dimens, xlim=xlim, ylim=ylim)

irisModel3 <- mclustModel(iris[,-5], irisBIC, G=3)
irisSim3 <- sim(modelName = irisModel3$modelName, 
               parameters = irisModel3$parameters, n = 500, seed = 1)
## Not run: 
##D  irisModel3$n <- NULL
##D  irisSim3 <- do.call("sim",c(list(n=500,seed=1),irisModel3)) # alternative call
## End(Not run)
clPairs(irisSim3[,-1], cl = irisSim3[,1])



