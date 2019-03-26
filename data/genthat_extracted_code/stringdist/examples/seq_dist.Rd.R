library(stringdist)


### Name: seq_dist
### Title: Compute distance metrics between integer sequences
### Aliases: seq_dist seq_distmatrix

### ** Examples

# Distances between lists of integer vectors. Note the postfix 'L' to force 
# integer storage. The shorter argument is recycled over (\code{a})
a <- list(c(102L, 107L))                        # fu
b <- list(c(102L,111L,111L),c(102L,111L,111L))  # foo, fo
seq_dist(a,b)

# translate strings to a list of integer sequences 
a <- lapply(c("foo","bar","baz"),utf8ToInt)
seq_distmatrix(a)

# Note how missing values are treated. NA's as part of the sequence are treated 
# as an integer (the representation of NA_integer_).
a <- list(NA_integer_,c(102L, 107L))
b <- list(c(102L,111L,111L),c(102L,111L,NA_integer_))  
seq_dist(a,b)

## Not run: 
##D # Distance between sentences based on word order. Note: words must match exactly or they
##D # are treated as completely different.
##D #
##D # For this example you need to have the 'hashr' package installed.
##D a <- "Mary had a little lamb"
##D a.words <- strsplit(a,"[[:blank:]]+")
##D a.int <- hashr::hash(a.words)
##D b <- c("a little lamb had Mary",
##D            "had Mary a little lamb")
##D b.int <- hashr::hash(strsplit(b,"[[:blank:]]+"))
##D seq_dist(a.int,b.int)
## End(Not run)




