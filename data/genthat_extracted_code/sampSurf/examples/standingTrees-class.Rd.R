library(sampSurf)


### Name: standingTrees-class
### Title: Class '"standingTrees"'
### Aliases: standingTrees-class hist,standingTrees-method
###   plot,standingTrees,missing-method summary,standingTrees-method
### Keywords: classes

### ** Examples

showClass("standingTrees")
buff = matrix(c(0,100,0,100), nrow=2, byrow=TRUE,
              dimnames=list(c('x','y'),c('min','max')))
st = sampleTrees(10, dbh = c(10,25), sampleRect = buff)
sts = standingTrees(st)
summary(sts)



