library(MixfMRI)


### Name: Print Objects
### Title: Print fclust related outputs
### Aliases: print.fclust
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)

### Check 2d data.
da <- pval.2d.complex
id <- !is.na(da)
PV.gbd <- da[id]
# hist(PV.gbd, nclass = 100, main = "p-value")

### Test 2d data.
id.loc <- which(id, arr.ind = TRUE)
X.gbd <- t(t(id.loc) / dim(da))
ret <- fclust(X.gbd, PV.gbd, K = 2)
print(ret)



