library(PEIP)


### Name: rnk
### Title: Rank of Matrix
### Aliases: rnk
### Keywords: misc

### ** Examples



hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
X <- hilbert(9)[,1:6]
rnk(X)





