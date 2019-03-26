library(rminer)


### Name: mining
### Title: Powerful function that trains and tests a particular fit model
###   under several runs and a given validation method
### Aliases: mining centralpar
### Keywords: classif regression neural nonlinear

### ** Examples

### dontrun is used when the execution of the example requires some computational effort.

### simple regression example
x1=rnorm(200,100,20); x2=rnorm(200,100,20)
y=0.7*sin(x1/(25*pi))+0.3*sin(x2/(25*pi))
# mining with an ensemble of neural networks, each fixed with size=2 hidden nodes
# assumes a default holdout (random split) with 2/3 for training and 1/3 for testing:
M=mining(y~x1+x2,Runs=2,model="mlpe",search=2)
print(M)
print(mmetric(M,metric="MAE"))

### more regression examples:
## Not run: 
##D # simple nonlinear regression task; x3 is a random variable and does not influence y:
##D data(sin1reg)
##D # 5 runs of an external holdout with 2/3 for training and 1/3 for testing, fixed seed 12345
##D # feature selection: sabs method
##D # model selection: 5 searches for size, internal 2-fold cross validation fixed seed 123
##D #                  with optimization for minimum MAE metric 
##D M=mining(y~.,data=sin1reg,Runs=5,method=c("holdout",2/3,12345),model="mlpe",
##D          search=list(search=mparheuristic("mlpe",n=5),method=c("kfold",2,123),metric="MAE"),
##D          feature="sabs")
##D print(mmetric(M,metric="MAE"))
##D print(M$mpar)
##D print("median hidden nodes (size) and number of MLPs (nr):")
##D print(centralpar(M$mpar))
##D print("attributes used by the model in each run:")
##D print(M$attributes)
##D mgraph(M,graph="RSC",Grid=10,main="sin1 MLPE scatter plot")
##D mgraph(M,graph="REP",Grid=10,main="sin1 MLPE scatter plot",sort=FALSE)
##D mgraph(M,graph="REC",Grid=10,main="sin1 MLPE REC")
##D mgraph(M,graph="IMP",Grid=10,main="input importances",xval=0.1,leg=names(sin1reg))
##D # average influence of x1 on the model:
##D mgraph(M,graph="VEC",Grid=10,main="x1 VEC curve",xval=1,leg=names(sin1reg)[1])
## End(Not run)

### regression example with holdout rolling windows:
## Not run: 
##D # simple nonlinear regression task; x3 is a random variable and does not influence y:
##D data(sin1reg)
##D # rolling with 20 test samples, training window size of 300 and increment of 50 in each run:
##D # note that Runs argument is automatically set to 14 in this example:
##D M=mining(y~.,data=sin1reg,method=c("holdoutrol",20,300,50),
##D          model="mlpe",debug=TRUE)
## End(Not run)

### regression example with all rminer models:
## Not run: 
##D # simple nonlinear regression task; x3 is a random variable and does not influence y:
##D data(sin1reg)
##D models=c("naive","ctree","rpart","kknn","mlp","mlpe","ksvm","randomForest","mr","mars",
##D          "cubist","pcr","plsr","cppls","rvm")
##D for(model in models)
##D { 
##D  M=mining(y~.,data=sin1reg,method=c("holdout",2/3,12345),model=model)
##D  cat("model:",model,"MAE:",round(mmetric(M,metric="MAE")$MAE,digits=3),"\n")
##D }
## End(Not run)

### classification example (task="prob")
## Not run: 
##D data(iris)
##D # 10 runs of a 3-fold cross validation with fixed seed 123 for generating the 3-fold runs
##D M=mining(Species~.,iris,Runs=10,method=c("kfold",3,123),model="rpart")
##D print(mmetric(M,metric="CONF"))
##D print(mmetric(M,metric="AUC"))
##D print(meanint(mmetric(M,metric="AUC")))
##D mgraph(M,graph="ROC",TC=2,baseline=TRUE,Grid=10,leg="Versicolor",
##D        main="versicolor ROC")
##D mgraph(M,graph="LIFT",TC=2,baseline=TRUE,Grid=10,leg="Versicolor",
##D        main="Versicolor ROC")
##D M2=mining(Species~.,iris,Runs=10,method=c("kfold",3,123),model="ksvm")
##D L=vector("list",2)
##D L[[1]]=M;L[[2]]=M2
##D mgraph(L,graph="ROC",TC=2,baseline=TRUE,Grid=10,leg=c("DT","SVM"),main="ROC")
## End(Not run)

### other classification examples
## Not run: 
##D ### 1st example:
##D data(iris)
##D # 2 runs of an external 2-fold validation, random seed
##D # model selection: SVM model with rbfdot kernel, automatic search for sigma,
##D #                  internal 3-fold validation, random seed, minimum "AUC" is assumed
##D # feature selection: none, "s" is used only to store input importance values
##D M=mining(Species~.,data=iris,Runs=2,method=c("kfold",2,NA),model="ksvm",
##D          search=list(search=mparheuristic("ksvm"),method=c("kfold",3)),feature="s")
##D 
##D print(mmetric(M,metric="AUC",TC=2))
##D mgraph(M,graph="ROC",TC=2,baseline=TRUE,Grid=10,leg="SVM",main="ROC",intbar=FALSE)
##D mgraph(M,graph="IMP",TC=2,Grid=10,main="input importances",xval=0.1,
##D leg=names(iris),axis=1)
##D mgraph(M,graph="VEC",TC=2,Grid=10,main="Petal.Width VEC curve",
##D data=iris,xval=4)
##D ### 2nd example, ordered kfold, k-nearest neigbor:
##D M=mining(Species~.,iris,Runs=1,method=c("kfoldo",3),model="knn")
##D # confusion matrix:
##D print(mmetric(M,metric="CONF"))
##D 
##D ### 3rd example, use of all rminer models: 
##D models=c("naive","ctree","rpart","kknn","mlp","mlpe","ksvm","randomForest","bagging",
##D          "boosting","lda","multinom","naiveBayes","qda")
##D models="naiveBayes"
##D for(model in models)
##D { 
##D  M=mining(Species~.,iris,Runs=1,method=c("kfold",3,123),model=model)
##D  cat("model:",model,"ACC:",round(mmetric(M,metric="ACC")$ACC,digits=1),"\n")
##D }
## End(Not run)

### for more fitting examples check the help of function fit: help(fit,package="rminer")



