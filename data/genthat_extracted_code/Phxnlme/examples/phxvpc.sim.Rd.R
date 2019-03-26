library(Phxnlme)


### Name: phxvpc.sim
### Title: Visual predictive check data simulation using Phoenix NLME based
###   on final parameter estimates.
### Aliases: phxvpc.sim

### ** Examples

## Note: .mdl file must be in the format as specified in the details section.
## Alternatively, use simmodel for VPC simulation.
## Note that pheno2.mdl needs to be modified to follow the specified format prior to
## running examples below

if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 5"
model.file="pheno2.mdl"
cols.file="colspheno2.txt" 
data="pheno2.csv" 

## Run model fit
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

## VPC simulation 
#phxvpc.sim(path)
}

## Change confidence interval of prediction percentiles
#phxvpc.sim(path, pi.ci=c(0.05, 0.95))

## Bin by boundaries
#phxvpc.sim(path, bin.option="bound", bin.bound=c(0, 0.5, 4, 8, 12))

## Note: lyon04.mdl needs to be modified to specified format prior to running example below
## For models not using build-in PK structure model
## Run model fit
if(!is.null(checkphxnlme(testchk=TRUE))){
path="C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1"
model.file="lyon04.mdl"
cols.file="COLS04.txt" 
data="EMAX02.csv" 
phxnlme(path=path,model.file=model.file,cols.file=cols.file,data=data)

#phxvpc.sim(path, ivar="DOSE")

## Stratified VPC, 1 covariate
#phxvpc.sim(path, ivar="DOSE", pstrat="FEMALE")

## Stratified VPC, 3 covariates (covariates must be included in bot data and cols.file)
#phxvpc.sim(path, pstrat=c("SEX", "AGE", "DOSE"))
}



