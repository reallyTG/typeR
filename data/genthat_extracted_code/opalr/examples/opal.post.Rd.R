library(opalr)


### Name: opal.post
### Title: Generic REST resource creation.
### Aliases: opal.post

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
opal.post(o, 'some', 'resources', body='{"some":"value"}')
opal.logout(o)
## End(No test)



