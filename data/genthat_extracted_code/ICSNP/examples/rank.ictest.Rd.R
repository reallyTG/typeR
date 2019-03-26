library(ICSNP)


### Name: rank.ictest
### Title: One Sample Location Test based on Marginal Ranks in the
###   Independent Component Model
### Aliases: rank.ictest rank.ictest.default rank.ictest.ics
### Keywords: htest multivariate nonparametric

### ** Examples

set.seed(555)
X <- cbind(rt(30,8), rnorm(30,0.5), runif(30,-3,3))
mix.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X.mixed <- X %*% t(mix.matrix)
ica.X <- ics(X, covOrigin, cov4, S2args = list(location = "Origin"))
rank.ictest(ica.X)
rank.ictest(ica.X, scores = "normal", method = "simu")
rank.ictest(ics.components(ica.X), scores = "normal", method = "perm")
rm(.Random.seed)
         


