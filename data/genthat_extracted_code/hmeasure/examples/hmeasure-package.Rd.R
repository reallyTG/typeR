library(hmeasure)


### Name: hmeasure-package
### Title: The H-measure and other classification performance metrics
### Aliases: hmeasure-package hmeasure
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

# report aggregate metrics
summary(results)
# additionally report threshold-specific metrics
summary(results,show.all=TRUE)


# produce the four different types of available plots
par(mfrow=c(2,2))
plotROC(results,which=1)
plotROC(results,which=2)
plotROC(results,which=3)
plotROC(results,which=4)


# experiment with different classification thresholds
HMeasure(true.class,scores,threshold=0.3)$metrics[c('Sens','Spec')]
HMeasure(true.class,scores,threshold=c(0.3,0.3))$metrics[c('Sens','Spec')]
HMeasure(true.class,scores,threshold=c(0.5,0.3))$metrics[c('Sens','Spec')]

# experiment with fixing the sensitivity (resp. specificity)
summary(HMeasure(true.class,scores,level=c(0.95,0.99)))

# experiment with non-default severity ratios
results.SR1 <- HMeasure(
  true.class, data.frame(LDA=scores.lda,kNN=scores.knn),severity.ratio=1)
results.SR1$metrics[c('H','KS','ER','FP','FN')]





