library(RcppGreedySetCover)


### Name: greedySetCover
### Title: Greedy Set Cover
### Aliases: greedySetCover
### Keywords: cover greedy set

### ** Examples

# Create some data.
set.seed(333)
X <- data.table::rbindlist(
  lapply(
    seq_len(1e4L),
    function(x) list(element=sample.int(n=1e3L,size=sample.int(50L,1L)))
  ),
  idcol="set"
)
# Elements are integers 1,2,...,1000.

# Run set cover
res <- greedySetCover(X,FALSE)
head(res)

# Check if all elements are covered.
identical(sort(unique(res$element)),sort(unique(X$element)))



