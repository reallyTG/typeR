library(rJST)


### Name: jst_reversed
### Title: Run a reversed Joint Sentiment Topic model
### Aliases: jst_reversed

### ** Examples

model <- jst(quanteda::dfm(quanteda::data_corpus_irishbudget2010), 
             paradigm(), 
             numTopics = 5, 
             numIters = 150)




