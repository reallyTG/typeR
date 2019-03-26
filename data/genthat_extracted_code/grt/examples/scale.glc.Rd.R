library(grt)


### Name: scale
### Title: Scale method for the class 'glc' and 'gqc'
### Aliases: scale scale.glc scale.gqc
### Keywords: array

### ** Examples


data(subjdemo_2d)
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
scale(fit.2dl)

fit.2dq <- gqc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
scale(fit.2dq)


## Not run: 
##D #plots using the discriminant scores
##D require(Hmisc)
##D options(digits=3)
##D fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
##D     category=subjdemo_2d$category, zlimit=7)
##D # z-scores based on the initial decision bound
##D # split by the true category membership
##D zinit <- split(scale(fit.2dl, initdb=TRUE), subjdemo_2d$category)
##D histbackback(zinit)
##D 
##D # z-scores based on the fitted decision bound
##D # split by the participants' response
##D zfit1 <- split(scale(fit.2dl, initdb=FALSE), subjdemo_2d$category)
##D histbackback(zfit1)
##D 
##D # z-scores based on the fitted decision bound
##D # split by the true category membership
##D zfit2 <- split(scale(fit.2dl, initdb=FALSE), subjdemo_2d$response)
##D histbackback(zfit2)
## End(Not run)



