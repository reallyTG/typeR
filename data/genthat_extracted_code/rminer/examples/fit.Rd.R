library(rminer)


### Name: fit
### Title: Fit a supervised data mining model (classification or
###   regression) model
### Aliases: fit model-class
### Keywords: classif regression neural nonlinear

### ** Examples

### dontrun is used when the execution of the example requires some computational effort.

### simple regression (with a formula) example.
x1=rnorm(200,100,20); x2=rnorm(200,100,20)
y=0.7*sin(x1/(25*pi))+0.3*sin(x2/(25*pi))
M=fit(y~x1+x2,model="mlpe")
new1=rnorm(100,100,20); new2=rnorm(100,100,20)
ynew=0.7*sin(new1/(25*pi))+0.3*sin(new2/(25*pi))
P=predict(M,data.frame(x1=new1,x2=new2,y=rep(NA,100)))
print(mmetric(ynew,P,"MAE"))

### simple classification example.
## Not run: 
##D data(iris)
##D M=fit(Species~.,iris,model="rpart")
##D plot(M@object); text(M@object) # show model
##D P=predict(M,iris)
##D print(mmetric(iris$Species,P,"CONF"))
##D print(mmetric(iris$Species,P,"ALL"))
##D mgraph(iris$Species,P,graph="ROC",TC=2,main="versicolor ROC",
##D baseline=TRUE,leg="Versicolor",Grid=10)
##D 
##D M2=fit(Species~.,iris,model="ctree")
##D plot(M2@object) # show model
##D P2=predict(M2,iris)
##D print(mmetric(iris$Species,P2,"CONF"))
##D 
##D # ctree with different setup:
##D # (ctree_control is from the party package)
##D M3=fit(Species~.,iris,model="ctree",controls = party::ctree_control(testtype="MonteCarlo"))
##D plot(M3@object) # show model
## End(Not run)

### simple binary classification example with cv.glmnet and xgboost
## Not run: 
##D data(sa_ssin_2)
##D H=holdout(sa_ssin_2$y,ratio=2/3)
##D # cv.glmnet:
##D M=fit(y~.,sa_ssin_2[H$tr,],model="cv.glmnet",task="cla") # pure classes
##D P=predict(M,sa_ssin_2[H$ts,])
##D cat("1st prediction, class:",as.character(P[1]),"\n")
##D cat("Confusion matrix:\n")
##D print(mmetric(sa_ssin_2[H$ts,]$y,P,"CONF")$conf)
##D 
##D M2=fit(y~.,sa_ssin_2[H$tr,],model="cv.glmnet") # probabilities
##D P2=predict(M2,sa_ssin_2[H$ts,])
##D L=M2@levels
##D cat("1st prediction, prob:",L[1],"=",P2[1,1],",",L[2],"=",P2[1,2],"\n")
##D cat("Confusion matrix:\n")
##D print(mmetric(sa_ssin_2[H$ts,]$y,P2,"CONF")$conf)
##D cat("AUC of ROC curve:\n")
##D print(mmetric(sa_ssin_2[H$ts,]$y,P2,"AUC"))
##D 
##D M3=fit(y~.,sa_ssin_2[H$tr,],model="cv.glmnet",nfolds=3) # use 3 folds instead of 10
##D plot(M3@object) # show cv.glmnet object
##D P3=predict(M3,sa_ssin_2[H$ts,])
##D 
##D # xgboost:
##D M4=fit(y~.,sa_ssin_2[H$tr,],model="xgboost",verbose=1) # nrounds=2, show rounds:
##D P4=predict(M4,sa_ssin_2[H$ts,])
##D print(mmetric(sa_ssin_2[H$ts,]$y,P4,"AUC"))
##D M5=fit(y~.,sa_ssin_2[H$tr,],model="xgboost",nrounds=3,verbose=1) # nrounds=3, show rounds:
##D P5=predict(M5,sa_ssin_2[H$ts,])
##D print(mmetric(sa_ssin_2[H$ts,]$y,P5,"AUC"))
## End(Not run)

### classification example with discrete classes, probabilities and holdout
## Not run: 
##D data(iris)
##D H=holdout(iris$Species,ratio=2/3)
##D M=fit(Species~.,iris[H$tr,],model="ksvm",task="class")
##D M2=fit(Species~.,iris[H$tr,],model="ksvm",task="prob")
##D P=predict(M,iris[H$ts,])
##D P2=predict(M2,iris[H$ts,])
##D print(mmetric(iris$Species[H$ts],P,"CONF"))
##D print(mmetric(iris$Species[H$ts],P2,"CONF"))
##D print(mmetric(iris$Species[H$ts],P,"CONF",TC=1))
##D print(mmetric(iris$Species[H$ts],P2,"CONF",TC=1))
##D print(mmetric(iris$Species[H$ts],P2,"AUC"))
##D 
##D ### exploration of some rminer classification models:
##D models=c("lda","naiveBayes","kknn","randomForest","cv.glmnet","xgboost")
##D for(m in models)
##D  { cat("model:",m,"\n") 
##D    M=fit(Species~.,iris[H$tr,],model=m)
##D    P=predict(M,iris[H$ts,])
##D    print(mmetric(iris$Species[H$ts],P,"AUC")[[1]])
##D  }
## End(Not run)

### classification example with hyperparameter selection 
###    note: for regression, similar code can be used
### SVM 
## Not run: 
##D data(iris)
##D # large list of SVM configurations:
##D # SVM with kpar="automatic" sigma rbfdot kernel estimation and default C=1:
##D #  note: each execution can lead to different M@mpar due to sigest stochastic nature:
##D M=fit(Species~.,iris,model="ksvm")
##D print(M@mpar) # model hyperparameters/arguments
##D # same thing, explicit use of mparheuristic:
##D M=fit(Species~.,iris,model="ksvm",search=list(search=mparheuristic("ksvm")))
##D print(M@mpar) # model hyperparameters
##D 
##D # SVM with C=3, sigma=2^-7
##D M=fit(Species~.,iris,model="ksvm",C=3,kpar=list(sigma=2^-7))
##D print(M@mpar)
##D # SVM with different kernels:
##D M=fit(Species~.,iris,model="ksvm",kernel="polydot",kpar="automatic") 
##D print(M@mpar)
##D # fit already has a scale argument, thus the only way to fix scale of "tanhdot"
##D # is to use the special search argument with the "none" method:
##D s=list(smethod="none",search=list(scale=2,offset=2))
##D M=fit(Species~.,iris,model="ksvm",kernel="tanhdot",search=s) 
##D print(M@mpar)
##D # heuristic: 10 grid search values for sigma, rbfdot kernel (fdebug is used only for more verbose):
##D s=list(search=mparheuristic("ksvm",10)) # advised "heuristic10" usage
##D M=fit(Species~.,iris,model="ksvm",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # same thing, uses older search="heuristic10" that works for fewer rminer models
##D M=fit(Species~.,iris,model="ksvm",search="heuristic10",fdebug=TRUE)
##D print(M@mpar)
##D # identical search under a different and explicit code:
##D s=list(search=2^seq(-15,3,2))
##D M=fit(Species~.,iris,model="ksvm",search=2^seq(-15,3,2),fdebug=TRUE)
##D print(M@mpar)
##D 
##D # uniform design "UD" for sigma and C, rbfdot kernel, two level of grid searches, 
##D # under exponential (2^x) search scale:
##D M=fit(Species~.,iris,model="ksvm",search="UD",fdebug=TRUE)
##D print(M@mpar)
##D M=fit(Species~.,iris,model="ksvm",search="UD1",fdebug=TRUE)
##D print(M@mpar)
##D M=fit(Species~.,iris,model="ksvm",search=2^seq(-15,3,2),fdebug=TRUE)
##D print(M@mpar)
##D # now the more powerful search argument is used for modeling SVM:
##D # grid 3 x 3 search:
##D s=list(smethod="grid",search=list(sigma=2^c(-15,-5,3),C=2^c(-5,0,15)),convex=0,
##D             metric="AUC",method=c("kfold",3,12345))
##D print(s)
##D M=fit(Species~.,iris,model="ksvm",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # identical search with different argument smethod="matrix" 
##D s$smethod="matrix"
##D s$search=list(sigma=rep(2^c(-15,-5,3),times=3),C=rep(2^c(-5,0,15),each=3))
##D print(s)
##D M=fit(Species~.,iris,model="ksvm",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # search for best kernel (only works for kpar="automatic"):
##D s=list(smethod="grid",search=list(kernel=c("rbfdot","laplacedot","polydot","vanilladot")),
##D        convex=0,metric="AUC",method=c("kfold",3,12345))
##D print(s)
##D M=fit(Species~.,iris,model="ksvm",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # search for best parameters of "rbfdot" or "laplacedot" (which use same kpar):
##D s$search=list(kernel=c("rbfdot","laplacedot"),sigma=2^seq(-15,3,5))
##D print(s)
##D M=fit(Species~.,iris,model="ksvm",search=s,fdebug=TRUE)
##D print(M@mpar)
##D 
##D ### randomForest
##D # search for mtry and ntree
##D s=list(smethod="grid",search=list(mtry=c(1,2,3),ntree=c(100,200,500)),
##D             convex=0,metric="AUC",method=c("kfold",3,12345))
##D print(search)
##D M=fit(Species~.,iris,model="randomForest",search=s,fdebug=TRUE)
##D print(M@mpar)
##D 
##D ### rpart
##D # simpler way to tune cp in 0.01 to 0.9 (10 searches):
##D s=list(search=mparheuristic("rpart",n=10,lower=0.01,upper=0.9),method=c("kfold",3,12345))
##D M=fit(Species~.,iris,model="rpart",search=s,fdebug=TRUE)
##D print(M@mpar)
##D 
##D # same thing but with more lines of code
##D # note: this code can be adapted to tune other rpart parameters,
##D #       while mparheuristic only tunes cp
##D # a vector list needs to be used for the search$search parameter
##D lcp=vector("list",10) # 10 grid values for the complexity cp
##D names(lcp)=rep("cp",10) # same cp name 
##D scp=seq(0.01,0.9,length.out=10) # 10 values from 0.01 to 0.18
##D for(i in 1:10) lcp[[i]]=scp[i] # cycle needed due to [[]] notation
##D s=list(smethod="grid",search=list(control=lcp),
##D             convex=0,metric="AUC",method=c("kfold",3,12345))
##D M=fit(Species~.,iris,model="rpart",search=s,fdebug=TRUE)
##D print(M@mpar)
##D 
##D ### ctree 
##D # simpler way to tune mincriterion in 0.1 to 0.98 (9 searches):
##D mint=c("kfold",3,123) # internal validation method
##D s=list(search=mparheuristic("ctree",n=8,lower=0.1,upper=0.99),method=mint)
##D M=fit(Species~.,iris,model="ctree",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # same thing but with more lines of code
##D # note: this code can be adapted to tune other ctree parameters,
##D #       while mparheuristic only tunes mincriterion
##D # a vector list needs to be used for the search$search parameter
##D lmc=vector("list",9) # 9 grid values for the mincriterion
##D smc=seq(0.1,0.99,length.out=9)
##D for(i in 1:9) lmc[[i]]=party::ctree_control(mincriterion=smc[i]) 
##D s=list(smethod="grid",search=list(controls=lmc),method=mint,convex=0)
##D M=fit(Species~.,iris,model="ctree",search=s,fdebug=TRUE)
##D print(M@mpar)
##D 
##D ### some MLP fitting examples:
##D # simplest use:
##D M=fit(Species~.,iris,model="mlpe")  
##D print(M@mpar)
##D # same thing, with explicit use of mparheuristic:
##D M=fit(Species~.,iris,model="mlpe",search=list(search=mparheuristic("mlpe")))
##D print(M@mpar)
##D 
##D print(M@mpar) # hidden nodes and number of ensemble mlps
##D # setting some nnet parameters:
##D M=fit(Species~.,iris,model="mlpe",size=3,decay=0.1,maxit=100,rang=0.9) 
##D print(M@mpar) # mlpe hyperparameters
##D # MLP, 5 grid search fdebug is only used to put some verbose in the console:
##D s=list(search=mparheuristic("mlpe",n=5)) # 5 searches for size
##D print(s) # show search
##D M=fit(Species~.,iris,model="mlpe",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # previous searches used a random holdout (seed=NULL), now a fixed seed (123) is used:
##D s=list(smethod="grid",search=mparheuristic("mlpe",n=5),convex=0,metric="AUC",
##D             method=c("holdout",2/3,123))
##D print(search)
##D M=fit(Species~.,iris,model="mlpe",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # faster and greedy grid search:
##D s$convex=1;s$search=list(size=0:9)
##D print(search)
##D M=fit(Species~.,iris,model="mlpe",search=s,fdebug=TRUE)
##D print(M@mpar)
##D # 2 level grid with total of 5 searches 
##D #  note of caution: some "2L" ranges may lead to non integer (e.g. 1.3) values at
##D #  the 2nd level search. And some R functions crash if non integer values are used for
##D #  integer parameters.
##D s$smethod="2L";s$convex=0;s$search=list(size=c(4,8,12))
##D print(s)
##D M=fit(Species~.,iris,model="mlpe",search=s,fdebug=TRUE)
##D print(M@mpar)
## End(Not run)

### example of an error (warning) generated using fit:
## Not run: 
##D data(iris)
##D # size needs to be a positive integer, thus 0.1 leads to an error:
##D M=fit(Species~.,iris,model="mlp",size=0.1)  
##D print(M@object)
## End(Not run)

### exploration of some rminer regression models:
## Not run: 
##D data(sa_ssin)
##D H=holdout(sa_ssin$y,ratio=2/3,seed=12345)
##D models=c("lm","mr","ctree","mars","cubist","cv.glmnet","xgboost","rvm")
##D for(m in models)
##D  { cat("model:",m,"\n") 
##D    M=fit(y~.,sa_ssin[H$tr,],model=m)
##D    P=predict(M,sa_ssin[H$ts,])
##D    print(mmetric(sa_ssin$y[H$ts],P,"MAE"))
##D  }
## End(Not run)

### regression example with hyperparameter selection:
## Not run: 
##D data(sa_ssin)
##D # some SVM experiments:
##D # default SVM:
##D M=fit(y~.,data=sa_ssin,model="svm")
##D print(M@mpar)
##D # SVM with (Cherkassy and Ma, 2004) heuristics to set C and epsilon:
##D M=fit(y~.,data=sa_ssin,model="svm",C=NA,epsilon=NA)
##D print(M@mpar)
##D # SVM with Uniform Design set sigma, C and epsilon:
##D M=fit(y~.,data=sa_ssin,model="ksvm",search="UD",fdebug=TRUE)
##D print(M@mpar)
##D 
##D # sensitivity analysis feature selection
##D M=fit(y~.,data=sa_ssin,model="ksvm",search=list(search=mparheuristic("ksvm",n=5)),feature="sabs") 
##D print(M@mpar)
##D print(M@attributes) # selected attributes (1, 2 and 3 are the relevant inputs)
##D 
##D # example that shows how transform works:
##D M=fit(y~.,data=sa_ssin,model="mr") # linear regression
##D P=predict(M,data.frame(x1=-1000,x2=0,x3=0,x4=0,y=NA)) # P should be negative
##D print(P)
##D M=fit(y~.,data=sa_ssin,model="mr",transform="positive")
##D P=predict(M,data.frame(x1=-1000,x2=0,x3=0,x4=0,y=NA)) # P is not negative
##D print(P)
## End(Not run)

### pure classification example with a generic R model ###
## Not run: 
##D ### nnet is adopted here but virtually ANY fitting function/package could be used:
##D 
##D # since the default nnet prediction is to provide probabilities, there is
##D # a need to create this "wrapping" function:
##D predictprob=function(object,newdata)
##D { predict(object,newdata,type="class") }
##D # list with a fit and predict function:
##D # nnet::nnet (package::function)
##D model=list(fit=nnet::nnet,predict=predictprob,name="nnet")
##D data(iris)
##D # note that size is not a fit parameter and it is sent directly to nnet:
##D M=fit(Species~.,iris,model=model,size=3,task="class") 
##D P=predict(M,iris)
##D print(P)
## End(Not run) 




