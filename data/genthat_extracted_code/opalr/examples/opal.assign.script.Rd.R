library(opalr)


### Name: opal.assign.script
### Title: R script assignment
### Aliases: opal.assign.script

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# assign a function and call it
opal.assign.script(o, 'hello', quote(function(x) { print(paste0('Hello ', x , '!'))}))
opal.execute(o, "hello('Mr Bean')")
opal.logout(o)
## End(No test)



