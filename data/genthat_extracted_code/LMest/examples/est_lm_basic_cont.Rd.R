library(LMest)


### Name: est_lm_basic_cont
### Title: Estimate basic LM model for continuous outcomes
### Aliases: est_lm_basic_cont

### ** Examples

# Example based on multivariate longitudinal continuous data 
# load data
require(mmm)
data(multiLongGaussian)
res = long2matrices(multiLongGaussian$ID,X=cbind(multiLongGaussian$X,multiLongGaussian$time),
      Y=cbind(multiLongGaussian$resp1, multiLongGaussian$resp2))
Y = res$YY

# fit of the Basic LM model for continuous outcomes
k = 3
out = est_lm_basic_cont(Y,k,mod=1,tol=10^-5)
summary(out)




