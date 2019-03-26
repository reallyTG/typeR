## Validate subset() methods for DSM objects

library(wordspace)

## example from ?subset.dsm)
model <- DSM_TermContext

m2 <- subset(model, nchar(term) <= 4, nnzero <= 3)
stopifnot(all.equal(dim(m2), c(3, 4)))

## without recursive=TRUE, condition on nonzero count is only satisfied in original matrix
m2 <- subset(model, nchar(term) <= 4, nnzero >= 2)
stopifnot(all.equal(dim(m2), c(3, 7)))

m2 <- subset(model, nchar(term) <= 4, nnzero >= 2, recursive=TRUE)
stopifnot(all.equal(dim(m2), c(3, 4)))
