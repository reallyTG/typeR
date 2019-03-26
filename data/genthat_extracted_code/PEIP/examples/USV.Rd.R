library(PEIP)


### Name: USV
### Title: Singular Value Decomposition
### Aliases: USV
### Keywords: misc

### ** Examples



 hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
     X <- hilbert(9)[,1:6]
     
h = USV(X)

print( h$U )





