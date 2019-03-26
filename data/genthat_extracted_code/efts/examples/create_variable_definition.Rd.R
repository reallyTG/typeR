library(efts)


### Name: create_variable_definition
### Title: Create a variable definition
### Aliases: create_variable_definition

### ** Examples

var_def <- create_variable_definition(name='rain_der', 
  longname='Rainfall ensemble forecast derived from some prediction', units='mm', 
  missval=-9999.0, precision='double', var_attribute=list(type=2L, 
    description="accumulated over the preceding interval", 
    dat_type = "der", dat_type_description="AWAP data interpolated from observations",
    location_type = "Point"))



