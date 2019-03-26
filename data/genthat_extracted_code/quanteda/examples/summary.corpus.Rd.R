library(quanteda)


### Name: summary.corpus
### Title: Summarize a corpus
### Aliases: summary.corpus
### Keywords: corpus internal

### ** Examples

summary(data_corpus_inaugural)
summary(data_corpus_inaugural, n = 10)
mycorpus <- corpus(data_char_ukimmig2010, 
                   docvars = data.frame(party=names(data_char_ukimmig2010))) 
summary(mycorpus, showmeta=TRUE) # show the meta-data
mysummary <- summary(mycorpus) # (quietly) assign the results
mysummary$Types / mysummary$Tokens # crude type-token ratio



