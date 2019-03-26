library(statnet.common)


### Name: ERRVL
### Title: Return the first argument passed (out of any number) that is not
###   a 'try-error' (result of 'try' encountering an error.
### Aliases: ERRVL
### Keywords: utilities

### ** Examples


print(ERRVL(1,2,3)) # 1
print(ERRVL(try(solve(0)),2,3)) # 2
print(ERRVL(1, stop("Error!"))) # No error

## Not run: 
##D # Error:
##D print(ERRVL(try(solve(0), silent=TRUE),
##D             stop("Error!")))
##D 
##D # Error with an elaborate message:
##D print(ERRVL(try(solve(0), silent=TRUE),
##D             stop("Stopped with an error: ", .)))
## End(Not run)



