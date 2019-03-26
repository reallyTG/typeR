library(plsRglm)


### Name: coefs.plsRglmnp
### Title: Coefficients for bootstrap computations of PLSGLR models
### Aliases: coefs.plsRglmnp
### Keywords: models

### ** Examples

data(Cornell)

# (Y,X) bootstrap of a PLSGLR model
# statistic=coefs.plsRglm is the default for (Y,X) bootstrap of a PLSGLR models.
set.seed(250)
modplsglm <- plsRglm(Y~.,data=Cornell,1,modele="pls-glm-family",family=gaussian)
Cornell.bootYT <- bootplsglm(modplsglm, R=250, statistic=coefs.plsRglmnp)



