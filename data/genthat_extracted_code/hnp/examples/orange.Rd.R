library(hnp)


### Name: orange
### Title: Orange tissue-culture experiment data
### Aliases: orange
### Keywords: datasets

### ** Examples

data(orange)

require(gamlss)
fit_nbI <- gamlss(embryos ~ block + poly(dose, 2) * sugar, 
                  family=NBII(), data=orange)
                  
d.fun <- function(obj) resid(obj)

s.fun <- function(n, obj) {
  mu <- obj$mu.fv
  sigma <- obj$sigma.fv
  rNBII(n, mu, sigma)
}

f.fun <- function(y.) {
  gamlss(y. ~ block + poly(dose, 2) * sugar, family=NBII(), data=orange)
}

## Not run: 
##D hnp(fit_nbI, newclass=TRUE, diagfun=d.fun, simfun=s.fun, fitfun=f.fun)
## End(Not run)

fit_pred <- gamlss(embryos ~ poly(dose, 2) * sugar, family=NBII(), data=orange)
orange.pred <- rbind(expand.grid(sugar=levels(orange$sugar)[-6], dose=18:150),
                     expand.grid(sugar="Glycerol", dose=6:50))
orange.pred$pred <- predict(fit_pred, newdata=orange.pred, type="response")
require(latticeExtra)
trellis.par.set(strip.background=list(col="lightgrey"))
xyplot(embryos ~ dose | sugar, scales=list(relation="free"), layout=c(3,2),
       data=orange, col=1, xlab="Dose levels", ylab="Number of embryos") +
  as.layer(xyplot(pred ~ dose | sugar, type="l", col=1, data=orange.pred))



