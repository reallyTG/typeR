library(stm)


### Name: convertCorpus
### Title: Convert 'stm' formatted documents to another format
### Aliases: convertCorpus

### ** Examples

#convert the poliblog5k data to slam package format
poliSlam <- convertCorpus(poliblog5k.docs, poliblog5k.voc, type="slam")
class(poliSlam)
poliMatrix <- convertCorpus(poliblog5k.docs, poliblog5k.voc, type="Matrix")
class(poliMatrix)
poliLDA <- convertCorpus(poliblog5k.docs, poliblog5k.voc, type="lda")
str(poliLDA)



