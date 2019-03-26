library(pkgmaker)


### Name: checkWarning
### Title: Extra Check Functions for RUnit
### Aliases: checkWarning

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


# check warnings
checkWarning({ warning('ah ah'); 3})
checkWarning({ warning('ah oh ah'); 3}, 'oh')
try( checkWarning(3) )
try( checkWarning({ warning('ah ah'); 3}, 'warn you') )




