library(EditImputeCont)


### Name: EditImputeCont-package
### Title: Simultaneous Edit-Imputation for Continuous Microdata Package
### Aliases: EditImputeCont-package EditImputeCont
### Keywords: package

### ** Examples

library(EditImputeCont)

## read the toy example data, which has two ratio edits and a balance edit
data(SimpleEx)
data1 = readData(Y.original=SimpleEx$D.obs, ratio=SimpleEx$Ratio.edit, 
	range=NULL, balance=SimpleEx$Balance.edit)

## create and initialize the model with 15 DP mixture components
# model1 = createModel(data.obj=data1, K=15)

## Run an iteration of MCMC

# model1$Iterate()

# dim(model1$Y.edited)
## [1]   1000   4  # Edit-imputed datasets of n=1000 records with p=4 variables

## Please see the example in the demo folder for more detailed explanation



