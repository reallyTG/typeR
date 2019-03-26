library(opalr)


### Name: opal.assign.table
### Title: Data assignment to a data.frame
### Aliases: opal.assign.table

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# assign a list of variables from table CNSIM1
opal.assign.table(o, symbol="D", value="datashield.CNSIM1", variables=list("GENDER","LAB_TSC"))
opal.execute(o, "colnames(D)")
# assign a table CNSIM1 with a identifiers column
opal.assign.table(o, symbol="H", value="datashield.CNSIM1", id.name="id")
opal.execute(o, "colnames(H)")
# assign all the variables matching 'LAB' from table HOP of opal object o
opal.assign.table(o, symbol="D", value="datashield.CNSIM1", variables="name().matches('LAB_')")
opal.execute(o, "colnames(D)")
opal.logout(o)
## End(No test)



