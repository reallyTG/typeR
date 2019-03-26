library(vwr)


### Name: coltheart.N
### Title: Compute Coltheart's N
### Aliases: coltheart.N

### ** Examples

data(spanish.words)
sample.words<-sample(spanish.words,20)
coltheart.N(sample.words,spanish.words)
coltheart.N(sample.words,spanish.words, method='levenshtein')



