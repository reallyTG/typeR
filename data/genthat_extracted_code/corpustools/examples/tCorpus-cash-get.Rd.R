library(corpustools)


### Name: tCorpus$get
### Title: Access the data from a tCorpus
### Aliases: tCorpus$get tCorpus$get_meta get get_meta

### ** Examples

d = data.frame(text = c('Text one first sentence. Text one second sentence', 'Text two'),
               medium = c('A','B'),
               date = c('2010-01-01','2010-02-01'),
               doc_id = c('D1','D2'))
tc = create_tcorpus(d, split_sentences = TRUE)

## get token data
tc$get()                     ## full data.table
tc$get(c('doc_id','token'))  ## data.table with selected columns
head(tc$get('doc_id'))       ## single column as vector
head(tc$get(as.df = TRUE))      ## return as regular data.frame

## get subset
tc$get(subset = token_id %in% 1:2)

## subset on keys using (fast) binary search
tc$get(doc_id = 'D1')              ## for doc_id
tc$get(doc_id = 'D1', token_id = 5) ## for doc_id / token pairs


##### use get for meta data with get_meta
tc$get_meta()

## option to repeat meta data to match tokens
tc$get_meta(per_token = TRUE) ## (note that first doc is repeated, and rows match tc$n)




