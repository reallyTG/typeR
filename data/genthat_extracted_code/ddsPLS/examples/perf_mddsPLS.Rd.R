library(ddsPLS)


### Name: perf_mddsPLS
### Title: Function to compute cross-validation performances.
### Aliases: perf_mddsPLS

### ** Examples

library(doParallel)
# Classification example :
data("penicilliumYES")
X <- penicilliumYES$X
X <- scale(X[,which(apply(X,2,sd)>0)])
Y <- as.factor(unlist(lapply(c("Melanoconidiu","Polonicum","Venetum"),
function(tt){rep(tt,12)})))
#res_cv_class <- perf_mddsPLS(X,Y,lambda_min=0.85,n_lambda=2,R = 2,
#mode = "clas",NCORES = 1,fold_fixed = rep(1:12,3))

# Regression example :
data("liver.toxicity")
X <- scale(liver.toxicity$gene)
Y <- scale(liver.toxicity$clinic)
#res_cv_reg <- perf_mddsPLS(Xs = X,Y = Y,lambda_min=0.8,n_lambda=2,R = 1,
# mode = "reg")



