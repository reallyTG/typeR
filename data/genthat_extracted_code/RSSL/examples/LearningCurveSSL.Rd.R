library(RSSL)


### Name: LearningCurveSSL
### Title: Compute Semi-Supervised Learning Curve
### Aliases: LearningCurveSSL LearningCurveSSL.matrix

### ** Examples

set.seed(1)
df <- generate2ClassGaussian(2000,d=2,var=0.6)

classifiers <- list("LS"=function(X,y,X_u,y_u) {
 LeastSquaresClassifier(X,y,lambda=0)}, 
  "Self"=function(X,y,X_u,y_u) {
    SelfLearning(X,y,X_u,LeastSquaresClassifier)}
)

measures <- list("Accuracy" =  measure_accuracy,
                 "Loss Test" = measure_losstest,
                 "Loss labeled" = measure_losslab,
                 "Loss Lab+Unlab" = measure_losstrain
)

# These take a couple of seconds to run
## Not run: 
##D # Increase the number of unlabeled objects
##D lc1 <- LearningCurveSSL(as.matrix(df[,1:2]),df$Class,
##D                         classifiers=classifiers,
##D                         measures=measures, n_test=1800,
##D                         n_l=10,repeats=3)
##D 
##D plot(lc1)
##D 
##D # Increase the fraction of labeled objects, example with 2 datasets
##D lc2 <- LearningCurveSSL(X=list("Dataset 1"=as.matrix(df[,1:2]),
##D                                "Dataset 2"=as.matrix(df[,1:2])),
##D                         y=list("Dataset 1"=df$Class,
##D                                "Dataset 2"=df$Class),
##D                         classifiers=classifiers,
##D                         measures=measures,
##D                         type = "fraction",repeats=3,
##D                         test_fraction=0.9)
##D 
##D plot(lc2)
## End(Not run)



