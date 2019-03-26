library(ordinalForest)


### Name: ordfor
### Title: Ordinal forests
### Aliases: ordfor

### ** Examples

data(hearth)

set.seed(123)
hearthsubset <- hearth[sort(sample(1:nrow(hearth), size=floor(nrow(hearth)*(1/2)))),]
ordforres <- ordfor(depvar="Class", data=hearthsubset, nsets=60, nbest=5, ntreeperdiv=100, 
  ntreefinal=1000, perffunction = "equal")
# NOTE: nsets=60 is not enough, because the prediction performance of the resulting 
# ordinal forest will be suboptimal!! In practice, nsets=1000 (default value) or a 
# larger number should be used.

ordforres

sort(ordforres$varimp, decreasing=TRUE)




