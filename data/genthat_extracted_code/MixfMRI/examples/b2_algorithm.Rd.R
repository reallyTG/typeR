library(MixfMRI)


### Name: algorithm
### Title: Main algorithms implemented in fclust
### Aliases: ecm.step.gbd apecma.step.gbd em.step.gbd
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
library(EMCluster, quietly = TRUE)
# .FC.CT$algorithm <- "em"
# .FC.CT$model.X <- "V"
# .FC.CT$ignore.X <- TRUE
.FC.CT$check.X.unit <- FALSE

### Test toy1.
set.seed(1234)
X.gbd <- toy1$X.gbd
PV.gbd <- toy1$PV.gbd
PARAM <- set.global(X.gbd, PV.gbd, K = 2)
PARAM.new <- initial.em.gbd(PARAM)
PARAM.toy1 <- em.step.gbd(PARAM.new)
id.toy1 <- .MixfMRIEnv$CLASS.gbd
print(PARAM.toy1$ETA)
RRand(toy1$CLASS.gbd, id.toy1)

## No test: 
  ### Test toy2.
  set.seed(1234)
  X.gbd <- toy2$X.gbd
  PV.gbd <- toy2$PV.gbd
  PARAM <- set.global(X.gbd, PV.gbd, K = 3)
  PARAM.new <- initial.em.gbd(PARAM)
  PARAM.toy2 <- em.step.gbd(PARAM.new)
  id.toy2 <- .MixfMRIEnv$CLASS.gbd
  print(PARAM.toy2$ETA)
  RRand(toy2$CLASS.gbd, id.toy2)
## End(No test)



