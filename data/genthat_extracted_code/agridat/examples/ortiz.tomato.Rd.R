library(agridat)


### Name: ortiz.tomato
### Title: Multi-environment trial of tomato in Latin America, weight/yield
###   and environmental covariates
### Aliases: ortiz.tomato ortiz.tomato.covs ortiz.tomato.yield
### Keywords: datasets

### ** Examples


data(ortiz.tomato.covs)
data(ortiz.tomato.yield)

if(require(pls) & require(reshape2))
# Double-centered yield matrix
Y <- acast(ortiz.tomato.yield, env ~ gen, value.var='yield')
Y <- sweep(Y, 1, rowMeans(Y, na.rm=TRUE))
Y <- sweep(Y, 2, colMeans(Y, na.rm=TRUE))

# Standardized covariates
X <- ortiz.tomato.covs
rownames(X) <- X$env
X <- X[,c("MxT", "MnT", "MeT", "Prec", "Day", "pH", "OM", "P", "K",
          "ExN", "ExP", "ExK", "Trim", "Driv", "Irr", "Dha")]
X <- scale(X)

# Now, PLS relating the two matrices.
# Note: plsr deletes observations with missing values

m1 <- plsr(Y~X)
# Inner-product relationships similar to Ortiz figure 1.
biplot(m1, which="x", var.axes=TRUE, main="ortiz.tomato - env*cov biplot")
#biplot(m1, which="y", var.axes=TRUE)



