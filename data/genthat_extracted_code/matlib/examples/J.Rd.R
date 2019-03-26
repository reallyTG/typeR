library(matlib)


### Name: J
### Title: Create a vector, matrix or array of constants
### Aliases: J

### ** Examples

J(3)
J(2,3)
J(2,3,2)
J(2,3, constant=2, dimnames=list(letters[1:2], LETTERS[1:3]))

X <- matrix(1:6, nrow=2, ncol=3)
dimnames(X) <- list(sex=c("M", "F"), day=c("Mon", "Wed", "Fri"))
J(2) %*% X      # column sums
X %*% J(3)      # row sums



