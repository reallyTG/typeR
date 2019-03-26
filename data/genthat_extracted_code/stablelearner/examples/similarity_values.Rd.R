library(stablelearner)


### Name: similarity_values
### Title: Extracting Similarity Values
### Aliases: similarity_values
### Keywords: resampling, similarity

### ** Examples

## No test: 
library("partykit")
res <- ctree(Species ~ ., data = iris)
stab <- stability(res)
similarity_values(stab)
## End(No test)



