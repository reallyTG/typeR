library(corpustools)


### Name: tCorpus$subset_query
### Title: Subset tCorpus token data using a query
### Aliases: tCorpus$subset_query subset_query

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)

## subset by reference
tc$subset_query('A')
tc$get_meta()

## using copy mechanic
tc2 = tc$subset_query('A AND D', copy=TRUE)

tc2$get_meta()

tc$get_meta() ## (unchanged)



