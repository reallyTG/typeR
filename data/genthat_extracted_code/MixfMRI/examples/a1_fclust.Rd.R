library(MixfMRI)


### Name: Main functions
### Title: Main MixfMRI function
### Aliases: fclust set.global PARAM PARAM.org
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
library(EMCluster, quietly = TRUE)
# .FC.CT$algorithm <- "em"
# .FC.CT$model.X <- "V"
# .FC.CT$ignore.X <- TRUE
.FC.CT$check.X.unit <- FALSE
set.seed(1234)

### Test toy1.
X.gbd <- toy1$X.gbd[, -3]
PV.gbd <- toy1$PV.gbd
PARAM <- fclust(X.gbd, PV.gbd, K = 2)
print(PARAM)
id.toy1 <- .MixfMRIEnv$CLASS.gbd
print(RRand(toy1$CLASS.gbd, id.toy1))

## No test: 
  ### Test toy2.
  X.gbd <- toy2$X.gbd[, -3]
  PV.gbd <- toy2$PV.gbd
  PARAM <- fclust(X.gbd, PV.gbd, K = 3)
  print(PARAM)
  id.toy2 <- .MixfMRIEnv$CLASS.gbd
  print(RRand(toy2$CLASS.gbd, id.toy2))
## End(No test)



