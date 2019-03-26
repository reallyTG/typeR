library(mcbiopi)


### Name: prime.implicants
### Title: Prime Implicants
### Aliases: prime.implicants print.primeImp
### Keywords: logic print

### ** Examples
## Not run: 
##D # Generate the truth table considered in Schwender (2007).
##D 
##D mat <- matrix(c(rep(0, 4), rep(1, 6), 
##D    rep(0, 6), rep(1, 4),
##D    0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 
##D    0, 1, 0, 1, 1, 1, 0, 1, 0, 1), ncol=4)
##D colnames(mat) <- paste("X", 1:4, sep="")
##D 
##D # Determining the prime implicants.
##D 
##D prime.implicants(mat)
## End(Not run)


