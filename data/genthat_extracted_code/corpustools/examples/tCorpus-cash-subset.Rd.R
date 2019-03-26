library(corpustools)


### Name: tCorpus$subset
### Title: Subset a tCorpus
### Aliases: tCorpus$subset tCorpus$subset_meta subset subset_meta

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')
tc$n ## original number of tokens

## select only first 20 tokens per document
tc$subset(token_id < 20)

tc$n ## number of tokens after subset

## note that the return value is not assigned to tc, or to a new name.
## rather, tc is changed by reference. To subset a copy of tc (the more classic R way),
## the copy argument can be used. The following line creates tc2 as a copy of tc,
## with only the first 10 tokens per document
tc2 <- tc$subset(token_id < 10, copy=TRUE)

tc$n   ## unchanged
tc2$n  ## subset of tc

## you can filter on term frequency and document frequency with the freq_filter() and
## docfreq_filter() functions
tc = create_tcorpus(sotu_texts, doc_column = 'id')
tc$subset( freq_filter(token, min = 20, max = 100) )
tc$get()


###### subset can be used for meta data by using the subset_meta argument, or the subset_meta method
tc$n_meta
tc$subset(subset_meta = president == 'Barack Obama')
tc$n_meta
tc$subset_meta(date == '2013-02-12')
tc$n_meta



