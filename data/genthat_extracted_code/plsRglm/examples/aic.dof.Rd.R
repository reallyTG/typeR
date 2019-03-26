library(plsRglm)


### Name: aic.dof
### Title: Akaike and Bayesian Information Criteria and Generalized minimum
###   description length
### Aliases: aic.dof bic.dof gmdl.dof
### Keywords: models regression utilities

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsR(yCornell,XCornell,4)
dof.object <- plsR.dof(modpls)
aic.dof(modpls$RSS,modpls$nr,dof.object$DoF,dof.object$sigmahat)
bic.dof(modpls$RSS,modpls$nr,dof.object$DoF,dof.object$sigmahat)
gmdl.dof(dof.object$sigmahat,modpls$nr,dof.object$DoF,dof.object$yhat)
naive.object <- plsR.dof(modpls,naive=TRUE)
aic.dof(modpls$RSS,modpls$nr,naive.object$DoF,naive.object$sigmahat)
bic.dof(modpls$RSS,modpls$nr,naive.object$DoF,naive.object$sigmahat)
gmdl.dof(naive.object$sigmahat,modpls$nr,naive.object$DoF,naive.object$yhat)



