library(oceanmap)


### Name: parameter_definitions
### Title: parameter definitions dataframe
### Aliases: parameter_definitions
### Keywords: parameter_definitions

### ** Examples

## Example
data(parameter_definitions)
head(parameter_definitions)

# selecting sea surface temperature parameter definition
parameter_definitions[parameter_definitions$param == "sst2",] 



