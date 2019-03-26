library(plsRglm)


### Name: permcoefs.plsRglm
### Title: Coefficients for permutation bootstrap computations of PLSGLR
###   models
### Aliases: permcoefs.plsRglm
### Keywords: models

### ** Examples

data(Cornell)

# (Y,X) bootstrap of a PLSGLR model
# statistic=coefs.plsRglm is the default for (Y,X) bootstrap of a PLSGLR models.
set.seed(250)
modplsglm <- plsRglm(Y~.,data=Cornell,1,modele="pls-glm-family",family=gaussian)
Cornell.bootYX <- bootplsglm(modplsglm, R=250, typeboot="plsmodel", 
sim="permutation", statistic=permcoefs.plsRglm)



