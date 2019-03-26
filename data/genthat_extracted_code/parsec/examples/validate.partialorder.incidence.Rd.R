library(parsec)


### Name: validate.partialorder.incidence
### Title: validate.partialorder.incidence
### Aliases: validate.partialorder.incidence

### ** Examples

M <- c(TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE,
FALSE, TRUE, TRUE, TRUE, TRUE)
M <- matrix(M, 4, 4)
rownames(M) <- colnames(M) <- LETTERS[1:4]

M <- validate.partialorder.incidence(M)

plot(M)



