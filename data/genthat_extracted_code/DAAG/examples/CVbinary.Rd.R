library(DAAG)


### Name: CVbinary
### Title: Cross-Validation for Regression with a Binary Response
### Aliases: CVbinary cv.binary
### Keywords: models

### ** Examples

frogs.glm <- glm(pres.abs ~ log(distance) + log(NoOfPools),
                 family=binomial,data=frogs)
CVbinary(frogs.glm)
mifem.glm <- glm(outcome ~ ., family=binomial, data=mifem)
CVbinary(mifem.glm)



