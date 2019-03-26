library(addhaz)


### Name: MultAddHaz
### Title: Fit Multinomial Additive Hazard Models
### Aliases: MultAddHaz
### Keywords: ~models ~regression ~survey

### ** Examples

  data(disabData)

  ## Model without bootstrap CI and no attribution
## Not run: 
##D   fit1 <- MultAddHaz(dis.mult ~ diab + arth + stro , data = disabData, weights = wgt,
##D                      attrib = FALSE)
##D   summary(fit1)
##D 
##D   ## Model with bootstrap CI and attribution without stratification, no parallel calculation
##D   # Warning message due to the low number of bootstrap replicates
##D 
##D   fit2 <- MultAddHaz(dis.mult ~ diab + arth + stro , data = disabData, weights = wgt,
##D                      attrib = TRUE, collapse.background = FALSE, attrib.disease = FALSE,
##D                      type.attrib = "both", seed = 111, bootstrap = TRUE, conf.level = 0.95,
##D                      nbootstrap = 5)
##D   summary(fit2)
##D 
##D   ## Model with bootstrap CI and attribution of diseases and background stratified by
##D   ## age, with parallel calculation of bootstrap CI
##D   # Warning message due to the low number of bootstrap replicates
##D 
##D   diseases <- as.matrix(disabData[,c("diab", "arth", "stro")])
##D   fit3 <- MultAddHaz(dis.mult ~ factor(age) -1 + diseases: factor(age), data = disabData,
##D                      weights = wgt, attrib = TRUE, attrib.var = age,
##D                      collapse.background = FALSE, attrib.disease = TRUE, type.attrib = "both",
##D                      seed = 111, bootstrap = TRUE, conf.level = 0.95, nbootstrap = 5,
##D                      parallel = TRUE, type.parallel = "snow", ncpus = 4)
##D 
##D   summary(fit3)
## End(Not run)



