library(WACS)


### Name: WACSestim
### Title: Estimation of the parameters of a WACS model
### Aliases: WACSestim

### ** Examples

## Not run: 
##D 
##D  ## For an estimation with default setting 
##D  ThisPar  = WACSestim(ThisData)
##D 
##D  ## For an estimation with max. 2 dry and wet weather types per season, 
##D  ## and production of plots
##D  ThisPar  = WACSestim(ThisData, Nclusters = 1:2, plot.it = TRUE) 
##D 
##D  ## For an estimation with exactly 2 dry and wet weather states per season, 
##D  ## clustering on variables 3 and 5 only and no production of plots
##D  ThisPar  = WACSestim(ThisData, Nclusters = 2, Vsel = c(3,5)) 
##D  
## End(Not run)





