library(DiscreteFDR)


### Name: build.stepfuns
### Title: Building step functions from 'pCDFlist'
### Aliases: build.stepfuns

### ** Examples

toyList <- list(c(0.3,0.7,1),c(0.1,0.65,1))
toyStep <- build.stepfuns(toyList)
toyStep[[1]](0.2)
toyStep[[2]](0.2)
toyStep[[1]](0.65)
toyStep[[2]](0.65)




