library(efts)


### Name: create_variable_definitions
### Title: Create variable definitions from a data frame
### Aliases: create_variable_definitions

### ** Examples

varsDef = data.frame(name=letters[1:3], stringsAsFactors=FALSE)
varsDef$longname=paste('long name for', varsDef$name)
varsDef$units='mm'
varsDef$missval=-999.0
varsDef$precision='double'
varsDef$type=2
varsDef$type_description='accumulated over the previous time step'
varsDef$location_type='Point'
str(create_variable_definitions(varsDef))




