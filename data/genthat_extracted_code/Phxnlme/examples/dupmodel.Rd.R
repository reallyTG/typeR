library(Phxnlme)


### Name: dupmodel
### Title: Duplicate a selected model.
### Aliases: dupmodel

### ** Examples

if(!is.null(checkphxnlme(testchk=TRUE))){

## When modsp.file exists, specify path and destination path
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3"
path.new="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME 
Command Line/Model 3/vpc_1"

## Duplicate model
dupmodel(path, path.new)

## When modsp.file does not exist, specify path, path.new, model.file, 
## cols.file, data, and bat.file
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3"
path.new="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME
/Command Line/Model 3/vpc_1"
model.file="fm1theo.mdl"
cols.file="colstheo.txt" 
data="ThBates.csv" 
bat.file="RunNLME.bat"

## Duplicate model
dupmodel(path=path,path.new=path.new,model.file=model.file,cols.file=col.file
,data=data, bat.file=bat.file)
}



