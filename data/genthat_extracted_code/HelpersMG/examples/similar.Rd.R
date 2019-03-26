library(HelpersMG)


### Name: similar
### Title: Test if two vectors contains the same elements independently of
###   their order
### Aliases: similar

### ** Examples

## Not run: 
##D A <- c("A", "B", "C", "D")
##D B <- c("A", "B", "C", "D")
##D similar(A, B)
##D similar(B, A)
##D A <- c(x="A", y="B", z="C", k="D")
##D B <- c(x="A", y="B", z="C", l="D")
##D similar(B, A)
##D similar(A, B, test.names=TRUE)
##D A <- c(x="A", y="B", z="C", k="D")
##D B <- c(x="A", z="C", k="D", y="B")
##D similar(B, A)
##D similar(A, B, test.names=TRUE)
## End(Not run)



