library(rJST)


### Name: topNwords
### Title: Show top N words for topics/sentiments
### Aliases: topNwords
###   topNwords,JST_reversed.result,numeric,numeric,numeric-method
###   topNwords,JST_reversed.result,numeric,ANY,ANY-method
###   topNwords,JST_reversed.result,numeric,-method
###   topNwords,JST.result,numeric,numeric,numeric-method
###   topNwords,JST.result,numeric,ANY,ANY-method
###   topNwords,JST.result,numeric,-method

### ** Examples

model <- jst(quanteda::data_dfm_lbgexample, paradigm())
topNwords(model, N = 30, topic = 2, sentiment = 1)



