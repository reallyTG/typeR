library(hmeasure)


### Name: plotROC
### Title: Plotting function illustrating the H-measure of classification
###   performance.
### Aliases: plotROC
### Keywords: ~classif

### ** Examples


  
# load the data
library(MASS) 
library(class) 
data(Pima.te) 

# split it into training and test
n <- dim(Pima.te)[1] 
ntrain <- floor(2*n/3) 
ntest <- n-ntrain
pima.train <- Pima.te[seq(1,n,3),]
pima.test <- Pima.te[-seq(1,n,3),]
true.class<-pima.test[,8]

# train an LDA classifier
pima.lda <- lda(formula=type~., data=pima.train)
out.lda <- predict(pima.lda,newdata=pima.test) 

# obtain the predicted labels and classification scores
scores.lda <- out.lda$posterior[,2]

# train k-NN classifier
class.knn <- knn(train=pima.train[,-8], test=pima.test[,-8],
  cl=pima.train$type, k=9, prob=TRUE, use.all=TRUE)
scores.knn <- attr(class.knn,"prob")
# this is necessary because k-NN by default outputs
# the posterior probability of the winning class
scores.knn[class.knn=="No"] <- 1-scores.knn[class.knn=="No"] 

# run the HMeasure function on the data frame of scores
scores <- data.frame(LDA=scores.lda,kNN=scores.knn)
results <- HMeasure(true.class,scores)


# produce the four different types of available plots
par(mfrow=c(2,2))
plotROC(results,which=1)
plotROC(results,which=2)
plotROC(results,which=3)
plotROC(results,which=4)





