library(probemod)


### Name: pickapoint
### Title: Pick-A-Point Technique
### Aliases: pickapoint spotlight

### ** Examples

## Not run: 
##D myModel <- lm('dv ~ iv + mod', data=someData)
##D pickapoint(myModel, dv='DV', iv='IV', mod='MOD')
##D pickapoint(myModel, dv='DV', iv='IV', mod='MOD', alpha=.01)
##D pickapoint(myModel, dv='DV', iv='IV', mod='MOD', method='percentiles')
##D pickapoint(myModel, dv='DV', iv='IV', mod='MOD', points=c(1,2,3))
## End(Not run)



