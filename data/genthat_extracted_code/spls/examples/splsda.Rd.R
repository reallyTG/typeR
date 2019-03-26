library(spls)


### Name: splsda
### Title: Fit SPLSDA classification models
### Aliases: splsda
### Keywords: models multivariate

### ** Examples

data(prostate)
# SPLSDA with eta=0.8 & 3 hidden components
f <- splsda( prostate$x, prostate$y, K=3, eta=0.8, scale.x=FALSE )
print(f)
# Print out coefficients
coef.f <- coef(f)
coef.f[ coef.f!=0, ]



