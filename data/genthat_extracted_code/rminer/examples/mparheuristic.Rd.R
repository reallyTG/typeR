library(rminer)


### Name: mparheuristic
### Title: Function that returns a list of searching (hyper)parameters for
###   a particular classification or regression model
### Aliases: mparheuristic
### Keywords: classif regression neural nonlinear

### ** Examples

## "kknn"
s=mparheuristic("kknn",n=1)
print(s)
s=mparheuristic("kknn",n=10)
print(s)
s=mparheuristic("kknn",lower=5,upper=15,by=2)
print(s)

## "mlpe"
s=mparheuristic("mlpe")
print(s) # "NA" means set size with inputs/2 in fit
s=mparheuristic("mlpe",n=10)
print(s) 

## "randomForest"
s=mparheuristic("randomForest",n=10)
print(s) 

## "ksvm"
s=mparheuristic("ksvm",n=10)
print(s) 
s=mparheuristic("ksvm",n=10,kernel="vanilladot")
print(s) 
s=mparheuristic("ksvm",n=10,kernel="polydot")
print(s) 

## "rpart" and "ctree" are special cases (see help(fit,package=rminer) examples):
s=mparheuristic("rpart",n=3)
print(s) 
s=mparheuristic("ctree",n=3)
print(s) 

### examples with fit
## Not run: 
##D ### classification
##D data(iris)
##D s=mparheuristic("ksvm",n=3,kernel="vanilladot")
##D print(s)
##D search=list(search=s,method=c("holdout",2/3,123))
##D M=fit(Species~.,data=iris,model="ksvm",search=search,fdebug=TRUE)
##D print(M@mpar)
##D 
##D ### regression
##D data(sa_ssin)
##D s=mparheuristic("ksvm",n=3,kernel="polydot")
##D print(s)
##D search=list(search=s,metric="MAE",method=c("holdout",2/3,123))
##D M=fit(y~.,data=sa_ssin,model="ksvm",search=search,fdebug=TRUE)
##D print(M@mpar)
## End(Not run)




