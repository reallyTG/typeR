library(probemod)


### Name: jn
### Title: Johnson-Neyman Technique
### Aliases: floodlight jn

### ** Examples

## Not run: 
##D myModel <- lm('DV ~ IV + MOD', data=someData)
##D jnresults <- jn(myModel, dv='DV', iv='IV', mod='MOD')
##D jnresults <- jn(myModel, dv='DV', iv='IV', mod='MOD', alpha=.01)
##D plot(jnresults)
## End(Not run)



