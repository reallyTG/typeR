library(opalr)


### Name: dsadmin.set_method
### Title: Set DataSHIELD method
### Aliases: dsadmin.set_method

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
dsadmin.set_method(o, 'foo', 'base::mean')
opal.logout(o)
## End(No test)



