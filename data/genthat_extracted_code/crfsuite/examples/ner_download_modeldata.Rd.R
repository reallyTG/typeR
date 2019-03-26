library(crfsuite)


### Name: ner_download_modeldata
### Title: CRF Training data: download training data for doing Named Entity
###   Recognition (NER)
### Aliases: ner_download_modeldata

### ** Examples

## Not run: 
##D x <- ner_download_modeldata("conll2002-nl")
##D x <- ner_download_modeldata("conll2002-es")
##D x <- ner_download_modeldata("GermanNER")
##D x <- ner_download_modeldata("wikiner-en-wp2")
##D x <- ner_download_modeldata("wikiner-nl-wp3")
##D x <- ner_download_modeldata("wikiner-fr-wp3")
## End(Not run)
## reduce number of docs
x <- ner_download_modeldata("conll2002-es", docs = 10)



