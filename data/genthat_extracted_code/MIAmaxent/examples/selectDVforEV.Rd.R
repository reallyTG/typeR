library(MIAmaxent)


### Name: selectDVforEV
### Title: Select parsimonious sets of derived variables.
### Aliases: selectDVforEV

### ** Examples

toydata_seldvs <- selectDVforEV(toydata_dvs$dvdata, alpha = 0.4)

## Not run: 
##D # From vignette:
##D grasslandDVselect <- selectDVforEV(grasslandDVs$dvdata, alpha = 0.001)
##D summary(grasslandDVs$dvdata)
##D sum(sapply(grasslandDVs$dvdata[-1], length))
##D summary(grasslandDVselect$dvdata)
##D sum(sapply(grasslandDVselect$dvdata[-1], length))
##D grasslandDVselect$selection$terdem
## End(Not run)




