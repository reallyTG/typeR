library(MIAmaxent)


### Name: selectEV
### Title: Select parsimonious set of explanatory variables.
### Aliases: selectEV

### ** Examples

## Not run: 
##D # From vignette:
##D grasslandEVselect <- selectEV(grasslandDVselect$dvdata, alpha = 0.001,
##D                               interaction = TRUE)
##D summary(grasslandDVselect$dvdata)
##D length(grasslandDVselect$dvdata[-1])
##D summary(grasslandEVselect$dvdata)
##D length(grasslandEVselect$dvdata[-1])
##D grasslandEVselect$selectedmodel$formula
## End(Not run)




