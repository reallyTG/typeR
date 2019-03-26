library(pkgmaker)


### Name: exitCheck
### Title: Exit Error Checks
### Aliases: exitCheck

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


# define some function
f <- function(err){

 # initialise an error checker
	success <- exitCheck()

 # do something on exit that depends on the error status
	on.exit({
		if(success()) cat("Exit with no error: do nothing\n") 
		else cat("Exit with error: cleaning up the mess ...\n") 
	})
	
 # throw an error here
	if( err ) stop('There is an error')
 
	success(1+1)
}

# without error
f(FALSE)
# with error
try( f(TRUE) )




