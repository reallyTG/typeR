library(UBL)


### Name: EvalClassifMetrics
### Title: Utility metrics for assessing the performance of utility-based
###   classification tasks.
### Aliases: EvalClassifMetrics
### Keywords: evaluation metrics

### ** Examples

# the synthetic data set provided with UBL package for classification
data(ImbC)
sp <- sample(1:nrow(ImbC), round(0.7*nrow(ImbC)))
train <- ImbC[sp, ]
test <- ImbC[-sp,]

# example with a utility matrix
# define a utility matrix (true class in rows and pred class in columns)
 matU <- matrix(c(0.2, -0.5, -0.3, -1, 1, -0.9, -0.9, -0.8, 0.9), byrow=TRUE, ncol=3)
# determine optimal preds (predictions that maximize utility)
library(e1071) # for the naiveBayes classifier
 resUtil <- UtilOptimClassif(Class~., train, test, mtr = matU, type="util",
                        learner = "naiveBayes", 
                        predictor.pars = list(type="raw", threshold = 0.01))
 
# learning a model without maximizing utility
 model <- naiveBayes(Class~., train)
 resNormal <- predict(model, test, type="class", threshold = 0.01)
#Check the difference in the total utility of the results
 EvalClassifMetrics(test$Class, resNormal, mtr=matU, type= "util")
 EvalClassifMetrics(test$Class, resUtil, mtr=matU, type= "util")
   
# example with a classification task that has a cost matrix associated
# define a cost matrix (true class in rows and pred class in columns)
 matC <- matrix(c(0, 0.5, 0.3, 1, 0, 0.9, 0.9, 0.8, 0), byrow=TRUE, ncol=3)
 resUtil <- UtilOptimClassif(Class~., train, test, mtr = matC, type="cost",
                            learner = "naiveBayes", 
                            predictor.pars = list(type="raw", threshold = 0.01))
 
 # learning a model without maximizing utility
 model <- naiveBayes(Class~., train)
 resNormal <- predict(model, test, type="class")
 #Check the difference in the total utility of the results
 EvalClassifMetrics(test$Class, resNormal, mtr=matC, type= "cost")
 EvalClassifMetrics(test$Class, resUtil, mtr=matC, type= "cost")
 
#example with a benefit matrix
# define a benefit matrix (true class in rows and pred class in columns)
 matB <- matrix(c(0.2, 0, 0, 0, 1, 0, 0, 0, 0.9), byrow=TRUE, ncol=3)
 
 resUtil <- UtilOptimClassif(Class~., train, test, mtr = matB, type="ben",
                            learner = "naiveBayes", 
                            predictor.pars = list(type="raw", threshold = 0.01))
 
# learning a model without maximizing utility
 model <- naiveBayes(Class~., train)
 resNormal <- predict(model, test, type="class", threshold = 0.01)
# Check the difference in the total utility of the results
 EvalClassifMetrics(test$Class, resNormal, mtr=matB, type= "ben")
 EvalClassifMetrics(test$Class, resUtil, mtr=matB, type= "ben")
 
 table(test$Class,resNormal)
 table(test$Class,resUtil)




