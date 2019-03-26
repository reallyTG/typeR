library(MultiVarSel)


### Name: whitening_choice
### Title: This function helps to choose the best whitening strategy among
###   the following types of dependence modellings: AR1, ARMA, non
###   parametric and without any whitening.
### Aliases: whitening_choice

### ** Examples

data(copals_camera)
Y=scale(Y[,1:100])
X <- model.matrix( ~ group + 0)
residuals=lm(as.matrix(Y)~X-1)$residuals
whitening_choice(residuals,c("AR1","nonparam","ARMA","no_whitening"),
pAR=1,qMA=1)



