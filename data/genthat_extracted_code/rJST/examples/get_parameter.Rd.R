library(rJST)


### Name: get_parameter
### Title: Get parameter from (reversed) JST results
### Aliases: get_parameter

### ** Examples

data <- quanteda::dfm(quanteda::data_corpus_irishbudget2010)
model <- jst(data, paradigm(), numTopics = 5, numIters = 50)

phi <- get_parameter(model, 'phi')




