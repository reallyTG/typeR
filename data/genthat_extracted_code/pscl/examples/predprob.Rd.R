library(pscl)


### Name: predprob
### Title: compute predicted probabilities from fitted models
### Aliases: predprob
### Keywords: regression models

### ** Examples

data("bioChemists")
zip <- zeroinfl(art ~ . | ., data = bioChemists, EM = TRUE)
phat <- predprob(zip)

newdata <- expand.grid(list(fem="Men",mar="Married",
                            kid5=1,phd=3.103,
                            ment=0:77))
phat <- predprob(zip, newdata = newdata)



