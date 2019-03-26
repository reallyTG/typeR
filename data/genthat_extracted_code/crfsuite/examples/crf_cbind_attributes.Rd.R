library(crfsuite)


### Name: crf_cbind_attributes
### Title: Enrich a data.frame by adding frequently used CRF attributes
### Aliases: crf_cbind_attributes

### ** Examples

x <- data.frame(doc_id = sort(sample.int(n = 10, size = 1000, replace = TRUE)))
x$pos <- sample(c("Art", "N", "Prep", "V", "Adv", "Adj", "Conj", 
                  "Punc", "Num", "Pron", "Int", "Misc"), 
                  size = nrow(x), replace = TRUE)
x <- crf_cbind_attributes(x, terms = "pos", by = "doc_id", 
                          from = -1, to = 1, ngram_max = 3)
head(x)

## Not run: 
##D ## Example on some real data
##D x <- ner_download_modeldata("conll2002-nl")
##D x <- crf_cbind_attributes(x, terms = c("token", "pos"), 
##D                           by = c("doc_id", "sentence_id"),
##D                           ngram_max = 3, sep = "|")
## End(Not run)



