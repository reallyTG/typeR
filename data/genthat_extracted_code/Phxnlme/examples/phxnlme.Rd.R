library(Phxnlme)


### Name: phxnlme
### Title: Run Phoenix NLME
### Aliases: phxnlme
### Keywords: Regression Non-linear Regression Models

### ** Examples

## Specify model folder path, model.file, cols.file and data
if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)
}



