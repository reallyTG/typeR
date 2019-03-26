library(lda)


### Name: word.counts
### Title: Compute Summary Statistics of a Corpus
### Aliases: word.counts document.lengths
### Keywords: utilities

### ** Examples

## Load the cora dataset.
data(cora.vocab)
data(cora.documents)

## Compute word counts using raw feature indices.
wc <- word.counts(cora.documents)
head(wc)
##   0   1   2   3   4   5 
## 136 876  14 111  19  29 

## Recompute them using the levels defined by the vocab file.
wc <- word.counts(cora.documents, cora.vocab)
head(wc)
##   computer  algorithms discovering    patterns      groups     protein 
##        136         876          14         111          19          29 

head(document.lengths(cora.documents))
## [1] 64 39 76 84 52 24



