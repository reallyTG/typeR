library(inline)


### Name: package.skeleton-methods
### Title: Generate the skeleton of a package
### Aliases: package.skeleton-methods package.skeleton,ANY,ANY-method
###   package.skeleton,character,CFunc-method
###   package.skeleton,character,CFuncList-method
### Keywords: methods

### ** Examples

## Not run: 
##D 
##D fx <- cxxfunction( signature(x = "integer", y = "numeric" ) , '
##D 	return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
##D ' )
##D package.skeleton( "foo", fx )
##D 
##D 
##D functions <- cxxfunction( 
##D 	list( 
##D 		ff = signature(), 
##D 		gg = signature( x = "integer", y = "numeric" )
##D 	), 
##D 	c( "return R_NilValue ;", "return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;")
##D )
##D package.skeleton( "foobar", functions )
##D 
## End(Not run)



