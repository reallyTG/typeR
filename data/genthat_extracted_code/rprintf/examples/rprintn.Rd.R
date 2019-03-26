library(rprintf)


### Name: rprintn
### Title: Build a character vector or list with number-based string
###   formatting
### Aliases: rprintn

### ** Examples

## Not run: 
##D 
##D # Format a single-entry character vector with numbering mechanism
##D rprintf('Hello, {1}', 'world')
##D rprintf('{1} ({2} years old)','Ken',24)
##D rprintf('He is {1} but has a height of {2:.2f}cm',18,190)
##D rprintf('{1}, {2:.1f}, {3:+.2f}, {2}, {1:.0f}',1.56,2.34,3.78)
##D rprintf('{2},{1}','x','y')
## End(Not run)



