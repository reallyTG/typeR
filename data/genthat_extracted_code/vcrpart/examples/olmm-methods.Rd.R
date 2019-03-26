library(vcrpart)


### Name: olmm-methods
### Title: Methods for 'olmm' objects
### Aliases: olmm-methods anova.olmm coefficients.olmm coef.olmm
###   deviance.olmm formula.olmm fixef fixef.glm fixef.olmm getCall.olmm
###   logLik.olmm model.frame.olmm model.matrix.olmm neglogLik2
###   neglogLik2.olmm ranef ranef.olmm ranefCov ranefCov.olmm resid.olmm
###   residuals.olmm simulate.olmm terms.olmm update.olmm VarCorr
###   VarCorr.olmm print.VarCorr.olmm vcov.olmm weights.olmm
### Keywords: methods

### ** Examples

## --------------------------------------------------------- #
## Example: Schizophrenia (see also example of 'olmm')
## --------------------------------------------------------- #

data(schizo)

schizo <- schizo[1:181,]
schizo$id <- droplevels(schizo$id)

## anova comparison
## ----------------

## fit two alternative models for the 'schizo' data
model.0 <- olmm(imps79o ~ tx + sqrt(week) + re(1|id), schizo)
model.1 <- olmm(imps79o ~ tx + sqrt(week)+tx*sqrt(week)+re(1|id),schizo)
anova(model.0, model.1)

## simulate responses
## ------------------

## simulate responses based on estimated random effects
simulate(model.0, newdata = schizo[1, ], ranef = TRUE, seed = 1)
simulate(model.0, newdata = schizo[1, ], seed = 1,
         ranef = ranef(model.0)[schizo[1, "id"],,drop=FALSE])
## simulate responses based on simulated random effects
newdata <- schizo[1, ]
newdata$id <- factor("123456789")
simulate(model.0, newdata = newdata, ranef = TRUE)

## other methods
## -------------

coef(model.1)
fixef(model.1)
head(model.matrix(model.1, "fe-ge"))
head(weights(model.1))
ranefCov(model.1)
head(resid(model.1))
terms(model.1, "fe-ge")
VarCorr(model.1)
head(weights(model.1, "subject"))



