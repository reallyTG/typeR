library(MixfMRI)


### Name: LRT
### Title: Likelihood ratio tests
### Aliases: lrt lrt2 lrt.betamean lrt.betaab
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)

### Test 2d data.
da <- pval.2d.mag
id <- !is.na(da)
PV.gbd <- da[id]
id.loc <- which(id, arr.ind = TRUE)
X.gbd <- t(t(id.loc) / dim(da))
ret <- fclust(X.gbd, PV.gbd, K = 2, min.1st.prop = 0.95)
# print(ret)

### p-values of rest clusters.
ret.lrt <- lrt(PV.gbd, ret$class, K = 2)
print(ret.lrt)
## No test: 
  ret.lrt2 <- lrt2(PV.gbd, ret$class, K = 3)
  print(ret.lrt2)
## End(No test)



