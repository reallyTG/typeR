library(rJava)


### Name: Exceptions
### Title: Exception handling
### Aliases: Exceptions $.Throwable $<-.Throwable

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)

Integer <- J("java.lang.Integer")
tryCatch( Integer$parseInt( "10.." ), NumberFormatException = function(e){
	e$jobj$printStackTrace() 
} )

# the dollar method is also implemented for Throwable conditions, 
# so that syntactic sugar can be used on condition objects
# however, in the example below e is __not__ a jobjRef object reference
tryCatch( Integer$parseInt( "10.." ), NumberFormatException = function(e){
	e$printStackTrace() 
} )


## Don't show: 
tryCatch( Integer$parseInt( "10.." ), NumberFormatException = function(e){
	classes <- class( e )
	stopifnot( "NumberFormatException" %in% classes )
	stopifnot( "Exception" %in% classes )
	stopifnot( "Object" %in% classes )
	stopifnot( "error" %in% classes )
	stopifnot( "condition" %in% classes )
} )
## End(Don't show)




