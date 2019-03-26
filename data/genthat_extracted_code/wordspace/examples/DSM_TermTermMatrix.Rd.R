library(wordspace)


### Name: DSM_TermTermMatrix
### Title: Example of a Term-Term Co-occurrence Matrix (wordspace)
### Aliases: DSM_TermTermMatrix DSM_TermTerm
### Keywords: datasets

### ** Examples


DSM_TermTermMatrix["time", ] # row vector for target noun "time"

all.equal(DSM_TermTermMatrix, head(DSM_TermTerm, Inf))

## Not run: 
##D plot(hclust(dist.matrix(DSM_TermTermMatrix, as.dist=TRUE)))
## End(Not run)




