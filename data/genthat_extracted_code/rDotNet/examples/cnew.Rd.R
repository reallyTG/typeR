library(rDotNet)


### Name: .cnew
### Title: Create .NET object for class of given name and arguments
### Aliases: .cnew

### ** Examples

## Not run: 
##D 
##D series <- rnorm(100)
##D 
##D ## create instance of an object, using fully qualified class name
##D obj <- .cnew ("com.stg.math.statistics.AugmentedDickeyFuller", series, 3, 'Driftless')
##D 
##D ## or create without fully qualified name
##D obj <- .cnew ("AugmentedDickeyFuller", series, 3, 'Driftless')
## End(Not run)


