library(rJava)


### Name: javaImport
### Title: Attach mechanism for java packages
### Aliases: javaImport
### Keywords: programming

### ** Examples

## Not run: 
##D 	attach( javaImport( "java.util" ), pos = 2 , name = "java:java.util" )
##D 	
##D 	# now we can just do something like this 
##D 	v <- new( Vector )
##D 	v$add( "foobar" )
##D 	ls( pos = 2 )
##D 	
##D 	# or this
##D 	m <- new( HashMap )
##D 	m$put( "foo", "bar" )
##D 	ls( pos = 2 )
##D 	
##D 	# or even this :
##D 	Collections$EMPTY_MAP
## End(Not run)



