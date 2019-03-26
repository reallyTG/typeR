library(robustbase)


### Name: rankMM
### Title: Simple Matrix Rank
### Aliases: rankMM
### Keywords: algebra array

### ** Examples

rankMM # - note the simple function definition

hilbert <- function(n) { i <- seq_len(n); 1/outer(i - 1L, i, "+") }
hilbert(4)
H12 <- hilbert(12)
rankMM(H12)        # 11 - numerically more realistic
rankMM(H12, tol=0) # -> 12
## explanation :
round(log10(svd(H12, 0,0)$d), 1)



