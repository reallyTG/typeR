library(opalr)


### Name: opal.assign.data
### Title: Data assignment
### Aliases: opal.assign.data

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# push an arbitrary data frame to the R server
opal.assign.data(o, "D", mtcars)
# push an arbitrary vector to the R server
opal.assign.data(o, "C", mtcars$cyl)
# push a string
opal.assign.data(o, "S", "Hello!")
opal.logout(o)
## End(No test)



