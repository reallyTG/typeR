library(SentimentAnalysis)


### Name: ngram_tokenize
### Title: N-gram tokenizer
### Aliases: ngram_tokenize
### Keywords: preprocessing

### ** Examples

library(tm)
en <- c("Romeo loves Juliet", "Romeo loves a girl")
en.corpus <- VCorpus(VectorSource(en))
tdm <- TermDocumentMatrix(en.corpus, 
                          control=list(wordLengths=c(1,Inf), 
                                       tokenize=function(x) ngram_tokenize(x, char=TRUE, 
                                                                           ngmin=3, ngmax=3)))
inspect(tdm)

ch <- c("abab", "aabb")
ch.corpus <- VCorpus(VectorSource(ch))
tdm <- TermDocumentMatrix(ch.corpus, 
                          control=list(wordLengths=c(1,Inf), 
                                       tokenize=function(x) ngram_tokenize(x, char=TRUE, 
                                                                           ngmin=1, ngmax=2)))
inspect(tdm)



