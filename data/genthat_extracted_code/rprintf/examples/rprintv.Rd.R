library(rprintf)


### Name: rprintv
### Title: Build a character vector or list with variable-based string
###   formatting
### Aliases: rprintv

### ** Examples

## Not run: 
##D 
##D # Format a single-entry character vector with variable mechanism
##D rprintf('Hello, $name', name='world')
##D rprintf('$name ($age years old)',name='Ken',age=24)
##D rprintf('He is $age but has a height of $height:.2fcm',age=18,height=190)
##D rprintf('$a, $b:.1f, $c:+.2f, $b, $a:.0f',a=1.56,b=2.34,c=3.78)
## End(Not run)



