library(earth)


### Name: residuals.earth
### Title: Residuals for an earth model
### Aliases: residuals.earth
### Keywords: models

### ** Examples

data(etitanic)
earth.mod <- earth(pclass ~ ., data=etitanic, glm=list(family=binomial))
head(resid(earth.mod, warn=FALSE))      # earth residuals, a column for each response
head(resid(earth.mod, type="earth"))    # same
head(resid(earth.mod, type="deviance")) # GLM deviance residuals, a column for each response



