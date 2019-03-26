library(MixfMRI)


### Name: Likelihood Mixture Tests with Identity Cov Matrix or Only p-values
### Title: Likelihood Mixture Tests with Identity Cov Matrix or Only
###   p-values
### Aliases: lmt.I lmt.pv
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
library(EMCluster, quietly = TRUE)
.FC.CT$model.X <- "I"
.FC.CT$check.X.unit <- FALSE
.FC.CT$CONTROL$debug <- 0
  
## No test: 
  ### Fit toy1.
  set.seed(1234)
  X.gbd <- toy1$X.gbd
  PV.gbd <- toy1$PV.gbd
  ret.2 <- fclust(X.gbd, PV.gbd, K = 2)
  ret.3 <- fclust(X.gbd, PV.gbd, K = 3)
  ret.4 <- fclust(X.gbd, PV.gbd, K = 4)
  ret.5 <- fclust(X.gbd, PV.gbd, K = 5)
  
  ### ARI
  RRand(toy1$CLASS.gbd, ret.2$class)
  RRand(toy1$CLASS.gbd, ret.3$class)
  RRand(toy1$CLASS.gbd, ret.4$class)
  RRand(toy1$CLASS.gbd, ret.5$class)
  
  ### Test toy1.
  (lmt.23 <- lmt.I(ret.2, ret.3, X.gbd, PV.gbd))
  (lmt.24 <- lmt.I(ret.2, ret.4, X.gbd, PV.gbd))
  (lmt.25 <- lmt.I(ret.2, ret.5, X.gbd, PV.gbd))
  (lmt.34 <- lmt.I(ret.3, ret.4, X.gbd, PV.gbd))
  (lmt.35 <- lmt.I(ret.3, ret.5, X.gbd, PV.gbd))
  (lmt.45 <- lmt.I(ret.4, ret.5, X.gbd, PV.gbd))
  
  ### Test toy1 using p-values only.
  (lmt.pv.23 <- lmt.pv(ret.2, ret.3, X.gbd, PV.gbd))
  (lmt.pv.24 <- lmt.pv(ret.2, ret.4, X.gbd, PV.gbd))
  (lmt.pv.25 <- lmt.pv(ret.2, ret.5, X.gbd, PV.gbd))
  (lmt.pv.34 <- lmt.pv(ret.3, ret.4, X.gbd, PV.gbd))
  (lmt.pv.35 <- lmt.pv(ret.3, ret.5, X.gbd, PV.gbd))
  (lmt.pv.45 <- lmt.pv(ret.4, ret.5, X.gbd, PV.gbd))
## End(No test)



