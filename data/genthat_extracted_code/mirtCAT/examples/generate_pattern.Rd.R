library(mirtCAT)


### Name: generate_pattern
### Title: Generate a CAT patterns
### Aliases: generate_pattern

### ** Examples

## Not run: 
##D 
##D # return real response vector given choices and (optional) answers 
##D pat <- generate_pattern(mod, Theta = 0, df=df)
##D # mirtCAT(df, mo=mod, local_pattern = pat)
##D 
##D # generate single pattern observed in dataset used to define mod
##D pat2 <- generate_pattern(mod, Theta = 0)
##D # mirtCAT(mo=mod, local_pattern = pat2)
##D 
##D # generate multiple patterns to be analyzed independently 
##D pat3 <- generate_pattern(mod, Theta = matrix(c(0, 2, -2), 3))
##D # mirtCAT(mo=mod, local_pattern = pat3)
##D 
## End(Not run)



