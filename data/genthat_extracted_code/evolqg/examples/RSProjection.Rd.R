library(evolqg)


### Name: RSProjection
### Title: Random Skewers projection
### Aliases: RSProjection PlotRSprojection

### ** Examples

library(magrittr)
# small MCMCsample to reduce run time, acctual sample should be larger 
data(dentus)
cov.matrices = dlply(dentus, .(species), function(x) lm(as.matrix(x[,1:4])~1)) %>% 
               laply(function(x) BayesianCalculateMatrix(x, samples = 50)$Ps)
cov.matrices = aperm(cov.matrices, c(3, 4, 1, 2))
rs_proj = RSProjection(cov.matrices, p = 0.8)  
PlotRSprojection(rs_proj, cov.matrices, ncol = 5)




