library(nproc)


### Name: predict.npc
### Title: Predicting the outcome of a set of new observations using the
###   fitted npc object.
### Aliases: predict.npc

### ** Examples

n = 1000
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
xtest = matrix(rnorm(n*2),n,2)
ctest = 1+3*xtest[,1]
ytest = rbinom(n,1,1/(1+exp(-ctest)))


## Not run: 
##D ##Use logistic classifier and the default type I error control with alpha=0.05
##D fit = npc(x, y, method = 'logistic')
##D pred = predict(fit,xtest)
##D fit.score = predict(fit,x)
##D accuracy = mean(pred$pred.label==ytest)
##D cat('Overall Accuracy: ',  accuracy,'\n')
##D ind0 = which(ytest==0)
##D ind1 = which(ytest==1)
##D typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
##D cat('Type I error: ', typeI, '\n')
##D typeII = mean(pred$pred.label[ind1]!=ytest[ind1]) #type II error on test set
##D cat('Type II error: ', typeII, '\n')
## End(Not run)



