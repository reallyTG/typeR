library(GROAN)


### Name: addRegressor
### Title: Add an extra regressor to a Workbench
### Aliases: addRegressor

### ** Examples

#creating a Workbench with all default arguments
wb = createWorkbench()
#adding a second regressor
wb = addRegressor(wb, regressor = phenoRegressor.dummy, regressor.name = 'dummy')

## Not run: 
##D #trying to add again a regressor with the same name would result in a naming conflict error
##D wb = addRegressor(wb, regressor = phenoRegressor.dummy, regressor.name = 'dummy')
## End(Not run)



