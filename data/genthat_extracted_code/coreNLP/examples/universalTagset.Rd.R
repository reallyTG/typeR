library(coreNLP)


### Name: universalTagset
### Title: Convert Penn TreeBank POS to Universal Tagset
### Aliases: universalTagset

### ** Examples

tok <- getToken(annoEtranger)
cbind(tok$POS,universalTagset(tok$POS))




