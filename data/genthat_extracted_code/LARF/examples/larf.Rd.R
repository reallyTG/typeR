library(LARF)


### Name: larf
### Title: Local Average Response Functions for Instrumental Variable
###   Estimation of Treatment Effects
### Aliases: larf

### ** Examples

data(c401k)
attach(c401k)

## Not run: 
##D # Continuous outcome. Treatment effects of participation in 401(k) 
##D # on net family financial assest
##D est1 <- larf(nettfa ~ inc + age + agesq + marr + fsize, treatment = p401k, 
##D instrument = e401k, data = c401k)
##D summary(est1)
##D 
##D # Nonparametric estimates of the probability of 
##D # receiving the treatment inducement
##D library(mgcv)
##D firstStep <- gam(e401k ~ s(inc) + s(age) + s(agesq) + marr + s(fsize), 
##D data=c401k, family=binomial(link = "probit"))
##D zProb <- firstStep$fitted
##D est2<- larf(nettfa ~ inc + age + agesq + marr + fsize, treatment = p401k, 
##D instrument = e401k, data = c401k, zProb = zProb)
##D summary(est2) 
##D 
##D # Binary outcome. Treatment effects of participation in 401(k) 
##D # on participation in IRA
##D est3 <- larf(pira ~ inc + age + agesq + marr + fsize, treatment = p401k, 
##D instrument = e401k, data = c401k)
##D summary(est3) 
## End(Not run)



