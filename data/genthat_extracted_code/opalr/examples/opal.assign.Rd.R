library(opalr)


### Name: opal.assign
### Title: Data or expression assignment
### Aliases: opal.assign

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# assign a list of variables from table CNSIM1
opal.assign(o, symbol="D", value="datashield.CNSIM1", variables=list("GENDER","LAB_TSC"))
# assign all the variables matching 'LAB' from table HOP of opal object o
opal.assign(o, symbol="D", value="datashield.CNSIM1", variables="name().matches('LAB_')")
# assign a function and call it
opal.assign.script(o, 'hello', quote(function(x) { print(paste0('Hello ', x , '!'))}))
opal.execute(o, "hello('Mr Bean')")
# push an arbitrary data frame to the R server
#opal.assign(o, "D", mtcars)
# push an arbitrary vector to the R server
#opal.assign(o, "C", mtcars$cyl)
opal.logout(o)
## End(No test)



