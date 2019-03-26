## ---- eval=FALSE---------------------------------------------------------
#  install.packages("nproc", repos = "http://cran.us.r-project.org")

## ------------------------------------------------------------------------
library(nproc)

## ------------------------------------------------------------------------
n = 1000
set.seed(0)
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))

## ------------------------------------------------------------------------
plot(x[y==1,],col=1,xlim=c(-4,4),xlab='x1',ylab='x2')
points(x[y==0,],col=2,pch=2)
legend("topright",legend=c('Class 1','Class 0'),col=1:2,pch=c(1,2))

## ------------------------------------------------------------------------
fit = npc(x, y, method = "lda", alpha = 0.05)

## ------------------------------------------------------------------------
xtest = matrix(rnorm(n*2),n,2)
ctest = 1+3*xtest[,1]
ytest = rbinom(n,1,1/(1+exp(-ctest)))

## ------------------------------------------------------------------------
pred = predict(fit,xtest)
fit.score = predict(fit,x)
accuracy = mean(pred$pred.label==ytest)
cat("Overall Accuracy: ",  accuracy,'\n')
ind0 = which(ytest==0)
typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
cat('Type I error: ', typeI, '\n')

## ------------------------------------------------------------------------
fit = npc(x, y, method = "logistic", alpha = 0.1)
pred = predict(fit,xtest)
accuracy = mean(pred$pred.label == ytest)
cat("Overall Accuracy: ",  accuracy,'\n')
ind0 = which(ytest == 0)
typeI = mean(pred$pred.label[ind0] != ytest[ind0]) #type I error on test set
cat('Type I error: ', typeI, '\n')

## ------------------------------------------------------------------------
fit = npc(x, y, method = "logistic", alpha = 0.1, split = 11)
pred = predict(fit,xtest)
accuracy = mean(pred$pred.label == ytest)
cat("Overall Accuracy: ",  accuracy,'\n')
ind0 = which(ytest == 0)
typeI = mean(pred$pred.label[ind0] != ytest[ind0]) #type I error on test set
cat('Type I error: ', typeI, '\n')

## ------------------------------------------------------------------------
methodlist = c("logistic", "penlog", "randomforest", "svm", 
                                        "lda", "nb", "ada")
for(method in methodlist){
fit = npc(x, y, method = method, alpha = 0.05)
pred = predict(fit,xtest)
accuracy = mean(pred$pred.label==ytest)
cat(method, ': Overall Accuracy: ',  accuracy,'\n')
ind0 = which(ytest==0)
typeI = mean(pred$pred.label[ind0]!=ytest[ind0]) #type I error on test set
cat(method, ': Type I error: ', typeI, '\n')
}


## ------------------------------------------------------------------------
fit = nproc(x, y, method = "nb")
plot(fit)

## ------------------------------------------------------------------------
fit2 = nproc(x, y, method = "lda")
plot(fit2)

## ------------------------------------------------------------------------
n = 1000
set.seed(0)
x1 = c(rnorm(n), rnorm(n) + 1)
x2 = c(rnorm(n), rnorm(n)*sqrt(6) + 1)
y = c(rep(0,n), rep(1,n))
fit1 = nproc(x1, y, split = 11, method = 'lda')
fit2 = nproc(x2, y, split = 11, method = 'lda')
v = compare(fit1, fit2)
legend('topleft',legend = c(expression(X[1]),expression(X[2])),col = 1:2,lty = c(1,1))

