### R code from vignette source 'hmeasure.Rnw'

###################################################
### code chunk number 1: hmeasure.Rnw:73-79
###################################################
library(MASS); library(class); data(Pima.te); 
# source("../R/hmeasure_package_v5.R")
library(hmeasure)
n <- dim(Pima.te)[1]; ntrain <- floor(2*n/3); ntest <- n-ntrain
pima.train <- Pima.te[seq(1,n,3),]
pima.test <- Pima.te[-seq(1,n,3),]


###################################################
### code chunk number 2: hmeasure.Rnw:82-83
###################################################
true.class<-pima.test[,8]; str(true.class)


###################################################
### code chunk number 3: hmeasure.Rnw:86-87
###################################################
pima.lda <- lda(formula=type~., data=pima.train)


###################################################
### code chunk number 4: hmeasure.Rnw:90-91
###################################################
out.lda <- predict(pima.lda,newdata=pima.test); class.lda <- out.lda$class;


###################################################
### code chunk number 5: hmeasure.Rnw:94-95
###################################################
lda.counts <- misclassCounts(class.lda,true.class); lda.counts$conf.matrix


###################################################
### code chunk number 6: hmeasure.Rnw:98-99
###################################################
print(lda.counts$metrics,digits=3)


###################################################
### code chunk number 7: hmeasure.Rnw:110-111
###################################################
relabel(c("Yes","No","No"))


###################################################
### code chunk number 8: hmeasure.Rnw:114-115
###################################################
relabel(c("case","noncase","case"))


###################################################
### code chunk number 9: hmeasure.Rnw:136-137
###################################################
out.lda$posterior[1:3,]


###################################################
### code chunk number 10: hmeasure.Rnw:140-142
###################################################
scores.lda <- out.lda$posterior[,2]; 
all((scores.lda > 0.5)== (class.lda=="Yes"))


###################################################
### code chunk number 11: hmeasure.Rnw:145-148
###################################################
lda.counts.T03 <- misclassCounts(scores.lda>0.3,true.class)
lda.counts.T03$conf.matrix
lda.counts.T03$metrics[c('Sens','Spec')]


###################################################
### code chunk number 12: hmeasure.Rnw:154-158
###################################################
class.knn <- knn(train=pima.train[,-8], test=pima.test[,-8],
  cl=pima.train$type, k=9, prob=TRUE, use.all=TRUE)
scores.knn <- attr(class.knn,"prob")
scores.knn[class.knn=="No"] <- 1-scores.knn[class.knn=="No"] 


###################################################
### code chunk number 13: hmeasure.Rnw:161-164
###################################################
scores <- data.frame(LDA=scores.lda,kNN=scores.knn)
results <- HMeasure(true.class,scores)
class(results)


###################################################
### code chunk number 14: hmeasure.Rnw:175-176
###################################################
plotROC(results)


###################################################
### code chunk number 15: hmeasure.Rnw:185-186
###################################################
summary(results)


###################################################
### code chunk number 16: hmeasure.Rnw:202-203
###################################################
summary(results,show.all=TRUE)


###################################################
### code chunk number 17: hmeasure.Rnw:206-207
###################################################
HMeasure(true.class,scores,threshold=0.3)$metrics[c('Sens','Spec')]


###################################################
### code chunk number 18: hmeasure.Rnw:210-211
###################################################
HMeasure(true.class,scores,threshold=c(0.3,0.3))$metrics[c('Sens','Spec')]


###################################################
### code chunk number 19: hmeasure.Rnw:214-215
###################################################
HMeasure(true.class,scores,threshold=c(0.5,0.3))$metrics[c('Sens','Spec')]


###################################################
### code chunk number 20: hmeasure.Rnw:220-221
###################################################
summary(HMeasure(true.class,scores,level=c(0.95,0.99)))


###################################################
### code chunk number 21: hmeasure.Rnw:246-247
###################################################
plotROC(results,which=4)


###################################################
### code chunk number 22: hmeasure.Rnw:286-287
###################################################
results$metrics[c('H','KS','ER','FP','FN')]


###################################################
### code chunk number 23: hmeasure.Rnw:290-291
###################################################
summary(pima.test[,8])


###################################################
### code chunk number 24: hmeasure.Rnw:294-297
###################################################
results.SR1 <- HMeasure(
  true.class, data.frame(LDA=scores.lda,kNN=scores.knn),severity.ratio=1)
results.SR1$metrics[c('H','KS','ER','FP','FN')]


###################################################
### code chunk number 25: hmeasure.Rnw:303-304
###################################################
plotROC(results,which=2)


###################################################
### code chunk number 26: hmeasure.Rnw:308-309
###################################################
plotROC(results.SR1,which=2)


###################################################
### code chunk number 27: hmeasure.Rnw:318-319
###################################################
plotROC(results,which=3)


