library(efts)


### Name: create_var_attribute_definition
### Title: Create variable attribute definition
### Aliases: create_var_attribute_definition

### ** Examples

va <- create_var_attribute_definition(type=2L, 
  type_description='accumulated over the preceding interval', location_type='Point')
vdef <- create_variable_definition(name='rain_sim', 
  longname='Rainfall ensemble forecast derived from some prediction', 
  units='mm', missval=-9999.0, precision='double', 
  var_attribute=va)




