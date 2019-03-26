library(AICcmodavg)


### Name: predictSE
### Title: Computing Predicted Values and Standard Errors
### Aliases: predictSE predictSE.default predictSE.gls predictSE.lme
###   predictSE.mer predictSE.merMod predictSE.unmarkedFitPCount
###   predictSE.unmarkedFitPCO
### Keywords: models

### ** Examples

##Orthodont data from Pinheiro and Bates (2000) revisited
## Not run: 
##D require(nlme)
##D m1 <- gls(distance ~ age, correlation = corCompSymm(value = 0.5, form = ~ 1 | Subject),
##D           data = Orthodont, method= "ML")
##D 
##D ##compare against lme fit
##D logLik(m1)
##D logLik(lme(distance ~ age, random = ~1 | Subject, data = Orthodont,
##D           method= "ML"))
##D ##both are identical
##D 
##D 
##D ##compute predictions and SE's for different ages
##D predictSE(m1, newdata = data.frame(age = c(8, 10, 12, 14)))
##D detach(package:nlme)
## End(Not run)


##example with mallard data set from unmarked package
## Not run: 
##D require(unmarked)
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D ##run model with zero-inflated Poisson abundance
##D fm.mall.one <- pcount(~ ivel + date  ~ length + forest, mallardUMF, K=30,
##D                       mixture = "ZIP")
##D ##make prediction
##D predictSE(fm.mall.one, type = "response", parm.type = "lambda",
##D           newdata = data.frame(length = 0, forest = 0, elev = 0))
##D ##compare against predict
##D predict(fm.mall.one, type = "state", backTransform = TRUE,
##D         newdata = data.frame(length = 0, forest = 0, elev = 0))
##D 
##D ##add offset in model to scale abundance per transect length
##D fm.mall.off <- pcount(~ ivel + date  ~ forest + offset(length), mallardUMF, K=30,
##D                       mixture = "ZIP")
##D ##make prediction
##D predictSE(fm.mall.off, type = "response", parm.type = "lambda",
##D           newdata = data.frame(length = 10, forest = 0, elev = 0))
##D ##compare against predict
##D predict(fm.mall.off, type = "state", backTransform = TRUE,
##D         newdata = data.frame(length = 10, forest = 0, elev = 0))
##D detach(package:unmarked)
## End(Not run)



