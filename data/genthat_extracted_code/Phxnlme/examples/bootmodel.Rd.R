library(Phxnlme)


### Name: bootmodel
### Title: Nonparametric bootstrap
### Aliases: bootmodel
### Keywords: method

### ** Examples

if(!is.null(checkphxnlme(testchk=TRUE))){
## Setting working directory to Model 1 
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## Run bootstrap
bootmodel(model="Model 1",setseed=NULL,clean=FALSE,hold=FALSE,nboot=50)
}



