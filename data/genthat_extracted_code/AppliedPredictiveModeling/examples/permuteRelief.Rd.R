library(AppliedPredictiveModeling)


### Name: permuteRelief
### Title: Permutation Statistics for the Relief Algorithm
### Aliases: permuteRelief
### Keywords: htest

### ** Examples

set.seed(874)
reliefEx3 <- easyBoundaryFunc(500)
reliefEx3$X1 <- scale(reliefEx3$X1)
reliefEx3$X2 <- scale(reliefEx3$X2)
reliefEx3$prob <- NULL

standardized <- permuteRelief(reliefEx3[, 1:2], reliefEx3$class, 
                              ## For efficiency, a small number of
                              ## permutations are used here.
                              nperm = 50,           
                              estimator="ReliefFequalK", 
                              ReliefIterations= 50)




