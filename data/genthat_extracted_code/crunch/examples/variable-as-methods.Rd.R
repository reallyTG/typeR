library(crunch)


### Name: variable-as-methods
### Title: as.* methods for variables
### Aliases: variable-as-methods as.Categorical as.Datetime as.Numeric
###   as.Text as.Numeric,CrunchVariable-method
###   as.Text,CrunchVariable-method as.Categorical,CrunchVariable-method
###   as.Datetime,CrunchVariable-method as.double.CrunchVariable
###   as.character.CrunchVariable

### ** Examples

## Not run: 
##D # ds$v1 is of type Text
##D is.Text(ds$v1)
##D # [1] TRUE
##D 
##D # that has strings of numbers
##D as.vector(ds$v1)
##D # [1] "32"   "8"    "4096" "1024"
##D 
##D # convert this to a numeric variable with the alias `v1_numeric`
##D ds$v1_numeric <- as.Numeric(ds$v1)
##D 
##D # the values are the same, but are now numerics and the type is Numeric
##D as.vector(ds$v1_numeric)
##D # [1]   32    8 4096 1024
##D is.Numeric(ds$v1_numeric)
##D # [1] TRUE
##D 
##D # this new variable is derived, so if new data is appended or streamed, the
##D # new rows of data will be updated.
##D is.derived(ds$v1_numeric)
##D # [1] TRUE
## End(Not run)



