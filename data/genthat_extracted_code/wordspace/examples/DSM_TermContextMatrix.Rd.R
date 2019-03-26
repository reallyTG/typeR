library(wordspace)


### Name: DSM_TermContextMatrix
### Title: Example of a Term-Context Co-occurrence Matrix (wordspace)
### Aliases: DSM_TermContextMatrix DSM_TermContext
### Keywords: datasets

### ** Examples


DSM_TermContextMatrix["time", ] # row vector for target noun "time"

all.equal(DSM_TermContextMatrix, head(DSM_TermContext, Inf))

# M M' = symmetric matrix of co-occurrence frequencies of nouns within articles
tcrossprod(DSM_TermContextMatrix) 




