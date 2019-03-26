library(corpustools)


### Name: tCorpus$set_levels
### Title: Change levels of factor columns
### Aliases: tCorpus$set_levels tCorpus$set_meta_levels set_levels
###   set_meta_levels

### ** Examples

tc = create_tcorpus(c('Text one first sentence. Text one second sentence', 'Text two'))

## change factor levels of a column in the token data
unique_tokens <- tc$get_levels('token')
tc$set_levels('token', toupper(unique_tokens))
tc$get()



