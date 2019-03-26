library(spam)


### Name: diag
### Title: Sparse Matrix diagonals
### Aliases: diag diag.of.spam diag.spam spam_diag diag,spam-method
###   diag,ANY-method diag<- diag<-,ANY-method diag<-,spam-method
###   diag<-.spam diag.spam<- diag.assign,spam-method
### Keywords: array algebra

### ** Examples

diag.spam(2, 4)           # 2*I4
smat <- diag.spam(1:5)
diag( smat)
diag( smat) <- 5:1

# The last line is equivalent to 
diag.spam( smat) <- 5:1

# Note that diag.spam( 1:5) <- 5:1 not work of course.





