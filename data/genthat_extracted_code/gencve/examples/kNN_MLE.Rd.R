library(gencve)


### Name: kNN_MLE
### Title: MLE k in kNN
### Aliases: kNN_MLE
### Keywords: classif

### ** Examples


#Two classes example
X <- MASS::synth.tr[,1:2]
Y <- MASS::synth.tr[,3]
kNN_MLE(X=X, Y=Y, plot=FALSE)

## Not run: 
##D #Three classes example
##D library("MASS") #need lda
##D Y<- iris[,5]
##D X<- iris[,1:4]
##D kopt <- kNN_MLE(X, Y)
##D kopt
##D #Mis-classification rates on training data.
##D #Of course FLDA does better in this case.
##D y <- factor(Y)
##D ans <- class::knn(train=X, test=X, k=kopt, cl=y)
##D etaKNN <- sum(ans!=y)/length(y)
##D iris.ldf <- MASS::lda(X, y)
##D yfitFLDA <- MASS::predict.lda(iris.ldf, newdata=X, dimen=1)$class
##D etaFLDA <- sum(yfitFLDA!=y)/length(y)
##D eta<-c(etaFLDA, etaKNN)
##D names(eta)<-c("FLDA", "kNN")
##D eta
## End(Not run)



