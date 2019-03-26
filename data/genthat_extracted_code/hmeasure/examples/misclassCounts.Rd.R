library(hmeasure)


### Name: misclassCounts
### Title: Computes misclassification counts and related statistics by
###   contrasting predicted with true class labels.
### Aliases: misclassCounts
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
class.lda <- out.lda$class
scores.lda <- out.lda$posterior[,2]

# compute misclassification counts and related statistics
lda.counts <- misclassCounts(class.lda,true.class)
lda.counts$conf.matrix
print(lda.counts$metrics,digits=3)


# repeat for different value of the classification threshold
lda.counts.T03 <- misclassCounts(scores.lda>0.3,true.class)
lda.counts.T03$conf.matrix
lda.counts.T03$metrics[c('Sens','Spec')]

  




