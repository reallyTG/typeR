library(opalr)


### Name: opal.valueset
### Title: Get the values of an entity
### Aliases: opal.valueset

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
opal.valueset(o, 'datashield', 'CNSIM1', '1008573362')
opal.logout(o)
## End(No test)



