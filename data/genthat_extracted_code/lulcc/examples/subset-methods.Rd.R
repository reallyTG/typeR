library(lulcc)


### Name: subset,ExpVarRasterList-method
### Title: Subset
### Aliases: subset,ExpVarRasterList-method
###   subset,PredictiveModelList-method subset,PerformanceList-method
###   subset,PredictionList-method

### ** Examples


## Sibuyan Island

## load observed land use data
obs <- ObsLulcRasterStack(x=sibuyan$maps,
                    pattern="lu",
                    categories=c(1,2,3,4,5),
                    labels=c("Forest","Coconut","Grass","Rice","Other"),
                    t=c(0,14))

summary(obs)
obs <- subset(obs, subset=names(obs)[1])
summary(obs)

## load explanatory variables
ef <- ExpVarRasterList(x=sibuyan$maps, pattern="ef")

summary(ef)
ef <- subset(ef, subset=1:5)
summary(ef)




