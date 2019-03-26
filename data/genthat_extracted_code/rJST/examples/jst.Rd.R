library(rJST)


### Name: jst
### Title: Run a Joint Sentiment Topic model
### Aliases: jst

### ** Examples

model <- jst(quanteda::dfm(quanteda::data_corpus_irishbudget2010), 
             paradigm(), 
             numTopics = 5, 
             numIters = 150)



