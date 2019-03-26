library(corpustools)


### Name: tCorpus$set
### Title: Modify the token and meta data.tables of a tCorpus
### Aliases: tCorpus$set tCorpus$set_meta set set_meta

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')

tc$get()  ## show original

## create new column
i <- 1:tc$n
tc$set(column = 'i', i)
## create new column based on existing column(s)
tc$set(column = 'token_upper', toupper(token))
## use subset to modify existing column
tc$set('token', paste0('***', token, '***'), subset = token_id == 1)
## use subset to create new column with NA's
tc$set('second_token', token, subset = token_id == 2)

tc$get()  ## show after set


##### use set for meta data with set_meta
tc$set_meta('party_pres', paste(party, president, sep=': '))
tc$get_meta()



