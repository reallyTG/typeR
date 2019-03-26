## ----timing1-------------------------------------------------------------
library(glmm)
data(salamander)
clust <- makeCluster(1)
set.seed(1234) 
start <- proc.time()
sal <- glmm(Mate ~ 0 + Cross, random = list(~ 0 + Female, 
~ 0 + Male), varcomps.names = c("F", "M"), data = salamander, 
family.glmm = bernoulli.glmm, m = 10^4, debug = TRUE, cluster = clust)
proc.time() - start
stopCluster(clust)

## ----timing2-------------------------------------------------------------
clust <- makeCluster(2)
set.seed(1234) 
start <- proc.time()
sal <- glmm(Mate ~ 0 + Cross, random = list(~ 0 + Female, 
~ 0 + Male), varcomps.names = c("F", "M"), data = salamander, 
family.glmm = bernoulli.glmm, m = 10^4, debug = TRUE, cluster = clust)
proc.time() - start
stopCluster(clust)

