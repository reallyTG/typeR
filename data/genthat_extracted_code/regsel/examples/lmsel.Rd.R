library(regsel)


### Name: lmsel
### Title: Linear regression with variable selection
### Aliases: lmsel

### ** Examples

data(prostate)
set.seed(10)
lmsel(lpsa~lcavol+lweight+age+lbph+svi+lcp+gleason+pgg45, indices=as.numeric(prostate$train),
data=prostate, varsel="lasso")

data(concrete)
lmsel(CompressiveStrength~., data=concrete, varsel="step", criterion="BIC")



