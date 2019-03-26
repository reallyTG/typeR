library(frailtypack)


### Name: slope
### Title: Identify variable associated with the random slope
### Aliases: slope
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(dataAdditive)
##D 
##D ##-- Additive with one covariate --##
##D 
##D modAdd1cov <- additivePenal(Surv(t1,t2,event)~cluster(group)+var1+
##D slope(var1),data=dataAdditive,n.knots=8,kappa=10000,hazard="Splines")
##D 
##D ##-- Additive with two covariates --##
##D 
##D set.seed(1234)
##D dataAdditive$var2 <- rbinom(nrow(dataAdditive),1,0.5)
##D 
##D modAdd2cov <- additivePenal(Surv(t1,t2,event)~cluster(group)+var1+
##D var2+slope(var1),data=dataAdditive,n.knots=8,kappa=10000,
##D hazard="Splines")
##D 
##D ##-- Additive with 2 covariates and stratification --##
##D 
##D dataAdditive$var2 <- rbinom(nrow(dataAdditive),1,0.5)
##D 
##D modAddstrat <- additivePenal(Surv(t1,t2,event)~cluster(group)+
##D strata(var2)+var1+slope(var1),data=dataAdditive,n.knots=8,
##D kappa=c(10000,10000),hazard="Splines")
##D 
## End(Not run)





