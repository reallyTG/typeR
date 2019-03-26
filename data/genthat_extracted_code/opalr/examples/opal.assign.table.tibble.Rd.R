library(opalr)


### Name: opal.assign.table.tibble
### Title: Data assignment to a tibble
### Aliases: opal.assign.table.tibble

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# assign a function and call it
opal.assign.table.tibble(o, 'D', 'datashield.CNSIM1')
opal.execute(o, "class(D)")
opal.logout(o)
## End(No test)



