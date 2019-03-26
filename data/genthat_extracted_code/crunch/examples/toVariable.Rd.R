library(crunch)


### Name: toVariable
### Title: Generic method for converting objects to Crunch representations
### Aliases: toVariable toVariable,character-method
###   toVariable,numeric-method toVariable,factor-method
###   toVariable,Date-method toVariable,POSIXt-method
###   toVariable,AsIs-method toVariable,VariableDefinition-method
###   toVariable,logical-method toVariable,labelled-method
###   toVariable,haven_labelled-method toVariable,labelled_spss-method
###   toVariable,haven_labelled_spss-method toVariable,CrunchExpr-method

### ** Examples

var1 <- rnorm(10)
toVariable(var1)
toVariable(var1, name="Random", description="Generated in R")
## Not run: 
##D ds$random <- toVariable(var1, name="Random")
##D # Or, this way:
##D ds <- addVariables(ds, toVariable(var1, name="Random"))
## End(Not run)



