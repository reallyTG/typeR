library(tm)


### Name: removeSparseTerms
### Title: Remove Sparse Terms from a Term-Document Matrix
### Aliases: removeSparseTerms

### ** Examples

data("crude")
tdm <- TermDocumentMatrix(crude)
removeSparseTerms(tdm, 0.2)



