library(opalr)


### Name: opal.execute
### Title: Execute a R script
### Aliases: opal.execute

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
opal.execute(o, "x <- 'foo'")
opal.execute(o, "ls()")
opal.logout(o)
## End(No test)



