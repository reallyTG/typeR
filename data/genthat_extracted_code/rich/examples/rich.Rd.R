library(rich)


### Name: rich
### Title: Species richness, their confidence interval and other useful
###   indices
### Aliases: rich

### ** Examples

data(ef)
# No bootstrap statistics
rich(matrix=ef)

## Not run: 
##D # Bootstrap estimation based on 499 randomizations
##D rich(matrix=ef, nrandom=499)
## End(Not run)



