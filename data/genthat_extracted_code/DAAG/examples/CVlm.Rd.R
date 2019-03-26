library(DAAG)


### Name: CVlm
### Title: Cross-Validation for Linear Regression
### Aliases: CVlm cv.lm
### Keywords: models

### ** Examples

CVlm()
## Not run: 
##D CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
##D           plotit="Observed")
##D CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
##D      plotit="Residual")
##D out <- CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
##D                plotit="Observed")
##D out[c("ms","df")]
## End(Not run)



