library(quanteda)


### Name: dfm_trim
### Title: Trim a dfm using frequency threshold-based feature selection
### Aliases: dfm_trim

### ** Examples

(mydfm <- dfm(data_corpus_inaugural[1:5]))

# keep only words occurring >= 10 times and in >= 2 documents
dfm_trim(mydfm, min_termfreq = 10, min_docfreq = 2)

# keep only words occurring >= 10 times and in at least 0.4 of the documents
dfm_trim(mydfm, min_termfreq = 10, min_docfreq = 0.4)

# keep only words occurring <= 10 times and in <=2 documents
dfm_trim(mydfm, max_termfreq = 10, max_docfreq = 2)

# keep only words occurring <= 10 times and in at most 3/4 of the documents
dfm_trim(mydfm, max_termfreq = 10, max_docfreq = 0.75)

# keep only words occurring 5 times in 1000, and in 2 of 5 of documents
dfm_trim(mydfm, min_docfreq = 0.4, min_termfreq = 0.005, termfreq_type = "prop")

# keep only words occurring frequently (top 20%) and in <=2 documents
dfm_trim(mydfm, min_termfreq = 0.2, max_docfreq = 2, termfreq_type = "quantile")

## Not run: 
##D # compare to removeSparseTerms from the tm package
##D (mydfm_tm <- convert(mydfm, "tm"))
##D tm::removeSparseTerms(mydfm_tm, 0.7)
##D dfm_trim(mydfm, min_docfreq = 0.3)
##D dfm_trim(mydfm, sparsity = 0.7)
## End(Not run)




