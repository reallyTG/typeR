library(corpustools)


### Name: tCorpus$set_name
### Title: Change column names of data and meta data
### Aliases: tCorpus$set_name tCorpus$set_meta_name set_name set_meta_name

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')

## change column name in token data
tc$names ## original column names
tc$set_name(oldname = 'token', newname = 'word')
tc$get()

## change column name in meta data
tc$meta_names ## original column names
tc$set_meta_name(oldname = 'party', newname = 'clan')
tc$set_meta_name(oldname = 'president', newname = 'clan leader')
tc$get_meta()



