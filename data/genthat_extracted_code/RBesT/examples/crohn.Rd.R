library(RBesT)


### Name: crohn
### Title: Crohn's disease.
### Aliases: crohn
### Keywords: datasets

### ** Examples

set.seed(546346)
map_crohn <- gMAP(cbind(y, y.se) ~ 1 | study,
                  family=gaussian,
                  data=transform(crohn, y.se=88/sqrt(n)),
                  weights=n,
                  tau.dist="HalfNormal", tau.prior=44,
                  beta.prior=cbind(0,88),
                  ## ensure fast example runtime
                  thin=1, chains=1)



