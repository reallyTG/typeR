library(pscl)


### Name: predprob.glm
### Title: Predicted Probabilties for GLM Fits
### Aliases: predprob.glm
### Keywords: models regression

### ** Examples

data(bioChemists)
glm1 <- glm(art ~ .,
            data=bioChemists,
            family=poisson,
            trace=TRUE)  ## poisson GLM
phat <- predprob(glm1)
apply(phat,1,sum)                    ## almost all 1.0



