library(brant)


### Name: brant
### Title: Brant Test
### Aliases: brant
### Keywords: models, brant, brant test, parallel regression assumption,
###   ordinal logit

### ** Examples

data = MASS::survey
data$Smoke = ordered(MASS::survey$Smoke,levels=c("Never","Occas","Regul","Heavy"))
model1 = MASS::polr(Smoke ~ Sex + Height, data=data, Hess=TRUE)
summary(model1)
brant(model1)



