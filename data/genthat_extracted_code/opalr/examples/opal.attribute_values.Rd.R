library(opalr)


### Name: opal.attribute_values
### Title: Get a vector of values
### Aliases: opal.attribute_values

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
var <- opal.variable(o, 'datashield', 'CNSIM1', 'GENDER')
opal.attribute_values(var$attributes)
opal.logout(o)
## End(No test)



