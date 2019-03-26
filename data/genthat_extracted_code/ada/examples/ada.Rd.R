library(ada)


### Name: ada
### Title: Fitting Stochastic Boosting Models
### Aliases: ada ada.default ada.formula ada.logit ada.gentle ada.real
###   ada.discrete ada.qtree1 ada.qtree2 ada.predst
### Keywords: classes models methods

### ** Examples

## fit discrete ada boost to a simple example
data(iris)
##drop setosa
iris[iris$Species!="setosa",]->iris
##set up testing and training data (60% for training)
n<-dim(iris)[1]
trind<-sample(1:n,floor(.6*n),FALSE)
teind<-setdiff(1:n,trind)
iris[,5]<- as.factor((levels(iris[,5])[2:3])[as.numeric(iris[,5])-1])
##fit 8-split trees
gdis<-ada(Species~.,data=iris[trind,],iter=20,nu=1,type="discrete")
##add testing data set
gdis=addtest(gdis,iris[teind,-5],iris[teind,5])
##plot gdis
plot(gdis,TRUE,TRUE)
##variable selection plot
varplot(gdis)
##pairwise plot
pairs(gdis,iris[trind,-5],maxvar=2)

##for many more examples refer to reference (Culp et al., 2006)



