library(immer)


### Name: immer_unique_patterns
### Title: Extracts Unique Item Response Patterns
### Aliases: immer_unique_patterns

### ** Examples

#############################################################################
# EXAMPLE 1: Unique item response patterns data.read
#############################################################################

data( data.read, package="sirt")
dat <- data.read

# extract item response patterns
res <- immer::immer_unique_patterns( dat)

## Not run: 
##D # back-conversion with expand.table
##D dat2 <- mirt::expand.table( cbind( res$y,  res$w ) )
##D # check correctness
##D colMeans(dat)
##D colMeans(dat2)
## End(Not run)



