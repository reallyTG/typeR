library(parsec)


### Name: is.preorder
### Title: is.preorder
### Aliases: is.preorder

### ** Examples

M <- c(TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE,
FALSE, TRUE, TRUE, TRUE, TRUE)
M <- matrix(M, 4, 4)
rownames(M) <- colnames(M) <- LETTERS[1:4]

is.preorder(M)



