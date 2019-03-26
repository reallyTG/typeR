library(InformativeCensoring)


### Name: gammaImpute
### Title: Perform gamma-Imputation for a given data set
### Aliases: gammaImpute

### ** Examples


## Not run: 
##D data(nwtco)
##D nwtco <- nwtco[1:500,]
##D 
##D #creating 2 imputed data sets (m=2) for speed, would normally create more
##D ans <- gammaImpute(formula=Surv(edrel,rel)~histol + instit,
##D                    data = nwtco, m=2, gamma.factor=1, DCO.time=6209)
##D 
##D #subject specific gamma (multiplied by gamma.factor to give the jump)
##D #NA for subjects that are not to be imputed
##D jumps <- c(rep(NA,10),rep(1,490))
##D DCO.values <- rep(6209,500)
##D 
##D ans.2 <- gammaImpute(formula=Surv(edrel,rel)~histol + instit + strata(stage),
##D                    data = nwtco, m=2, bootstrap.strata=strata(nwtco$stage),
##D                    gamma=jumps, gamma.factor=1, DCO.time=DCO.values)
##D 
##D #can also use column names
##D nwtco$gamma <- jumps
##D nwtco$DCO.time <- DCO.values
##D ans.3 <- gammaImpute(formula=Surv(edrel,rel)~histol + instit + strata(stage),
##D                    data = nwtco, m=2, bootstrap.strata=strata(nwtco$stage),
##D                    gamma="gamma", DCO.time="DCO.time")
## End(Not run)




