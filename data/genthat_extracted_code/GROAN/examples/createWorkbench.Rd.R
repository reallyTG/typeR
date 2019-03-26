library(GROAN)


### Name: createWorkbench
### Title: Workbench constructor
### Aliases: createWorkbench

### ** Examples

#creating a Workbench with all default arguments
wb1 = createWorkbench()
#another Workbench, with different crossvalidation
wb2 = createWorkbench(folds=5, reps=20)
#a third one, with a different regressor and extra parameters passed to regressor function
wb3 = createWorkbench(regressor=phenoRegressor.BGLR, regressor.name='Bayesian Lasso', type='BL')



