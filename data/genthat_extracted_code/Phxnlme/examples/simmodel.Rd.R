library(Phxnlme)


### Name: simmodel
### Title: Visual predictive check data simulation using Phoenix NLME based
###   on user-provided parameter values.
### Aliases: simmodel

### ** Examples

## Run model fit
if(!is.null(checkphxnlme(testchk=TRUE))){

path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 5"
model.file="pheno2.mdl"
cols.file="colspheno2.txt" 
data="pheno2.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## Manually create directory for duplicate model
dir.create(paste("C:/Program Files (x86)/Pharsight/Phoenix/application/"
           ,"Examples/NLME Command Line/Model 3/vpc_1",sep=""))
           
## Duplicate the model
path.new=paste("C:/Program Files (x86)/Pharsight/Phoenix/application/"
           ,"Examples/NLME Command Line/Model 3/vpc_1",sep="")
dupmodel(path, path.new)

## After duplicating model, change parameter intial vaules in .mdl file 
## to the final parameter estimates obtained from running model fit.

simmodel(vpcpath=path.new)

## Change confidence interval of prediction percentiles
simmodel(vpcpath=path.new, pi.ci=c(0.05, 0.95))

## Bin by boundaries
simmodel(vpcpath=path.new, bin.option="bound", bin.bound=c(0, 0.5, 4, 8, 12))
}

if(!is.null(checkphxnlme(testchk=TRUE))){

## For models not using build-in PK structure model
## Run model fit
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

dupmodel(path, path.new)

## After duplicating model, change parameter intial vaules in .mdl file 
## to the final parameter estimates obtained from running model fit.
simmodel(vpcpath=path.new, ivar="DOSE")

## Stratified VPC, 1 covariate
simmodel(path, ivar="DOSE", pstrat="FEMALE")

## Stratified VPC, 3 covariates (covariates must be included in data and cols.file)
simmodel(path, pstrat=c("SEX", "AGE", "DOSE"))
}



