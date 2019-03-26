library(PST)


### Name: query
### Title: Retrieve counts or next symbol probability distribution
### Aliases: query query,PSTf-method round,cprobd-method
### Keywords: models

### ** Examples

data(s1)
s1 <- seqdef(s1)
S1 <- pstree(s1, L=3)
## Retrieving from the node labelled 'a-a-a'
query(S1, "a-a-a")

## The node 'a-b-b-a' is not presetnin the tree, and the next symbol
## probability is retrieved from the node labelled 'b-b-a' (the longest
## suffix
query(S1, "a-b-b-a")



