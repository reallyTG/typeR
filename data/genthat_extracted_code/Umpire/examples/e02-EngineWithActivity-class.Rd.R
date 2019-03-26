library(Umpire)


### Name: EngineWithActivity-class
### Title: The "EngineWithActivity" Class
### Aliases: EngineWithActivity-class EngineWithActivity
###   rand,EngineWithActivity-method summary,EngineWithActivity-method
### Keywords: datagen classes

### ** Examples

showClass("EngineWithActivity")
nComponents <- 10
nGenes <- 100
active <- 0.7
comp <- list()
for (i in 1:nComponents) {
  comp[[i]] <- IndependentNormal(rnorm(nGenes/nComponents, 6, 1.5),
                                 1/rgamma(nGenes/nComponents, 44, 28))
}
myEngine <- EngineWithActivity(active, comp, 2)
summary(myEngine)
myData <- rand(myEngine, 5)
dim(myData)



