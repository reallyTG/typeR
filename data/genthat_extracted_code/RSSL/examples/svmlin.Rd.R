library(RSSL)


### Name: svmlin
### Title: svmlin implementation by Sindhwani & Keerthi (2006)
### Aliases: svmlin

### ** Examples

data(svmlin_example)
t_svmlin_1 <- svmlin(svmlin_example$X_train[1:50,],
                 svmlin_example$y_train,X_u=NULL, lambda = 0.001)
t_svmlin_2 <- svmlin(svmlin_example$X_train[1:50,],
                       svmlin_example$y_train,
                       X_u=svmlin_example$X_train[-c(1:50),], 
                       lambda = 10,lambda_u=100,algorithm = 2)
                       
# Calculate Accuracy
mean(predict(t_svmlin_1,svmlin_example$X_test)==svmlin_example$y_test)
mean(predict(t_svmlin_2,svmlin_example$X_test)==svmlin_example$y_test)

data(testdata)

g_svm <- SVM(testdata$X,testdata$y)
g_sup <- svmlin(testdata$X,testdata$y,testdata$X_u,algorithm = 3)
g_semi <- svmlin(testdata$X,testdata$y,testdata$X_u,algorithm = 2)

mean(predict(g_svm,testdata$X_test)==testdata$y_test)
mean(predict(g_sup,testdata$X_test)==testdata$y_test)
mean(predict(g_semi,testdata$X_test)==testdata$y_test)



