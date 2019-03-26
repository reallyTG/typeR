library(RBesT)


### Name: AS
### Title: Ankylosing Spondylitis.
### Aliases: AS
### Keywords: datasets

### ** Examples

set.seed(34563)
map_AS <- gMAP(cbind(r, n-r) ~ 1 | study,
               family=binomial,
               data=AS,
               tau.dist="HalfNormal", tau.prior=1,
               beta.prior=2,
               ## ensure fast example runtime
               thin=1, chains=1)



