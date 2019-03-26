library(polmineR)


### Name: get_token_stream
### Title: Get Token Stream Based on Corpus Positions.
### Aliases: get_token_stream get_token_stream,numeric-method
###   get_token_stream,matrix-method get_token_stream,character-method
###   get_token_stream,partition-method get_token_stream,regions-method

### ** Examples

get_token_stream(0:9, corpus = "GERMAPARLMINI", p_attribute = "word")
get_token_stream(0:9, corpus = "GERMAPARLMINI", p_attribute = "word", collapse = " ")
fulltext <- get_token_stream("GERMAPARLMINI", p_attribute = "word")



