library(mvbutils)


### Name: doc2Rd
### Title: Converts plain-text documentation to Rd format
### Aliases: doc2Rd docotest
### Keywords: programming

### ** Examples

## Needs a function with the right kind of "doc" attr
## Look at file "demostuff/sample.fun.rrr"
sample.fun <- source.mvb( system.file( file.path(
    'demostuff', 'sample.fun.rrr'), package='mvbutils'))
print( names( attributes( sample.fun)))
cat( '***Original plain-text doco:***\n')
print( as.cat( attr( sample.fun, 'doc'))) # unescaped, ie what you'd actually edit
cat( '\n***Rd output:***\n')
sample.fun.Rd <- doc2Rd( sample.fun)
print( sample.fun.Rd) # already "cat" class
## Not run: 
##D docotest( sample.fun) # should display in browser
## End(Not run)



