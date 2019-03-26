library(nproc)


### Name: npc
### Title: Construct a Neyman-Pearson Classifier from a sample of class 0
###   and class 1.
### Aliases: npc

### ** Examples

set.seed(1)
n = 1000
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
xtest = matrix(rnorm(n*2),n,2)
ctest = 1+3*xtest[,1]
ytest = rbinom(n,1,1/(1+exp(-ctest)))

##Use lda classifier and the default type I error control with alpha=0.05, delta=0.05
fit = npc(x, y, method = 'lda')
pred = predict(fit,xtest)
fit.score = predict(fit,x)
accuracy = mean(pred$pred.label==ytest)
cat('Overall Accuracy: ',  accuracy,'\n')
ind0 = which(ytest==0)
typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
cat('Type I error: ', typeI, '\n')

## Not run: 
##D ##Ensembled lda classifier with split = 11,  alpha=0.05, delta=0.05
##D fit = npc(x, y, method = 'lda', split = 11)
##D pred = predict(fit,xtest)
##D accuracy = mean(pred$pred.label==ytest)
##D cat('Overall Accuracy: ',  accuracy,'\n')
##D ind0 = which(ytest==0)
##D typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
##D cat('Type I error: ', typeI, '\n')
##D 
##D ##Now, change the method to logistic regression and change alpha to 0.1
##D fit = npc(x, y, method = 'logistic', alpha = 0.1)
##D pred = predict(fit,xtest)
##D accuracy = mean(pred$pred.label==ytest)
##D cat('Overall Accuracy: ',  accuracy,'\n')
##D ind0 = which(ytest==0)
##D typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
##D cat('Type I error: ', typeI, '\n')
##D 
##D ##Now, change the method to adaboost
##D fit = npc(x, y, method = 'ada', alpha = 0.1)
##D pred = predict(fit,xtest)
##D accuracy = mean(pred$pred.label==ytest)
##D cat('Overall Accuracy: ',  accuracy,'\n')
##D ind0 = which(ytest==0)
##D typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
##D cat('Type I error: ', typeI, '\n')
##D 
##D ##Now, try the adaptive splitting ratio
##D fit = npc(x, y, method = 'ada', alpha = 0.1, split.ratio = 'adaptive')
##D pred = predict(fit,xtest)
##D accuracy = mean(pred$pred.label==ytest)
##D cat('Overall Accuracy: ',  accuracy,'\n')
##D ind0 = which(ytest==0)
##D typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
##D cat('Type I error: ', typeI, '\n')
##D cat('Splitting ratio:', fit$split.ratio)
## End(Not run)



