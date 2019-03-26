library(RSSL)


### Name: CrossValidationSSL
### Title: Cross-validation in semi-supervised setting
### Aliases: CrossValidationSSL CrossValidationSSL.list
###   CrossValidationSSL.matrix

### ** Examples

X <- model.matrix(Species~.-1,data=iris)
y <- iris$Species

classifiers <- list("LS"=function(X,y,X_u,y_u) {
  LeastSquaresClassifier(X,y,lambda=0)}, 
  "EM"=function(X,y,X_u,y_u) {
    SelfLearning(X,y,X_u,
                 method=LeastSquaresClassifier)}
)

measures <- list("Accuracy" =  measure_accuracy,
                 "Loss" = measure_losstest,
                 "Loss labeled" = measure_losslab,
                 "Loss Lab+Unlab" = measure_losstrain
)

# Cross-validation making sure test folds are non-overlapping
cvresults1 <- CrossValidationSSL(X,y, 
                                 classifiers=classifiers, 
                                 measures=measures,
                                 leaveout="test", k=10,
                                 repeats = 2,n_labeled = 10)
print(cvresults1)
plot(cvresults1)

# Cross-validation making sure labeled sets are non-overlapping
cvresults2 <- CrossValidationSSL(X,y, 
                                 classifiers=classifiers, 
                                 measures=measures,
                                 leaveout="labeled", k=10,
                                 repeats = 2,n_labeled = 10,
                                 prop_unlabeled=0.5)
print(cvresults2)
plot(cvresults2)




