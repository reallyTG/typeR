library(maboost)


### Name: maboost
### Title: Binary and Multiclass Boosting Algorithms
### Aliases: maboost maboost.default maboost.formula maboost.machine.bin
###   maboost.machine.mult
### Keywords: classes models methods

### ** Examples

## fit maboost model
data(iris)
##drop setosa
iris[iris$Species!="setosa",]->iris
##set up testing and training data (60% for training)
n<-dim(iris)[1]
trind<-sample(1:n,floor(.6*n),FALSE)
teind<-setdiff(1:n,trind)
iris[,5]<- as.factor((levels(iris[,5])[2:3])[as.numeric(iris[,5])-1])
##fit a tree with maxdepth=6 (a variable pass to rpart.control). 
gdis<-maboost(Species~.,data=iris[trind,],iter=50,nu=2
                   ,breg="l2", type="sparse",bag.frac=1,random.feature=FALSE
                   ,random.cost=FALSE, C50tree=FALSE, maxdepth=6,verbose=TRUE)
##to see the average zeros in the weighting vectors over the 40 rounds of boosting
print(mean(gdis$model$num_zero))
##prediction
pred.gdis= predict(gdis,iris,type="class");
##variable selection
varplot.maboost(gdis)



