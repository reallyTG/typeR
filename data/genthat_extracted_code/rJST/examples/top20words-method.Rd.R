library(rJST)


### Name: top20words
### Title: Show top 20 words for topics/sentiments
### Aliases: top20words
###   top20words,JST_reversed.result,numeric,numeric-method
###   top20words,JST_reversed.result,ANY,ANY-method
###   top20words,JST_reversed.result-method
###   top20words,JST.result,numeric,numeric-method
###   top20words,JST.result,ANY,ANY-method top20words,JST.result-method

### ** Examples

model <- jst(quanteda::data_dfm_lbgexample, paradigm())
top20words(model, topic = 1, sentiment = 1)



