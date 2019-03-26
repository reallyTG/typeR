library(bst)


### Name: mhingeova
### Title: Multi-class HingeBoost
### Aliases: mhingeova print.mhingeova
### Keywords: classification

### ** Examples

## Not run: 
##D dat1 <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/
##D thyroid-disease/ann-train.data")
##D dat2 <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/
##D thyroid-disease/ann-test.data")
##D res <- mhingeova(xtr=dat1[,-22], ytr=dat1[,22], xte=dat2[,-22], yte=dat2[,22], 
##D cost=c(2/3, 0.5, 0.5), nu=0.5, learner="ls", m1=100, K=5, cv1=FALSE, 
##D twinboost=TRUE, m2= 200, cv2=FALSE)
##D res <- mhingeova(xtr=dat1[,-22], ytr=dat1[,22], xte=dat2[,-22], yte=dat2[,22], 
##D cost=c(2/3, 0.5, 0.5), nu=0.5, learner="ls", m1=100, K=5, cv1=FALSE, 
##D twinboost=TRUE, m2= 200, cv2=TRUE)
## End(Not run)



