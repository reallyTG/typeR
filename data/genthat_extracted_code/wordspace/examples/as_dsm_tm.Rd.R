library(wordspace)


### Name: as.dsm.tm
### Title: Create DSM Object From 'tm' Package (wordspace)
### Aliases: as.dsm.TermDocumentMatrix as.dsm.DocumentTermMatrix

### ** Examples


## Not run: 
##D library(tm) # tm package needs to be installed
##D data(crude) # news messages on crude oil from Reuters corpus
##D 
##D cat(as.character(crude[[1]]), "\n") # a text example
##D 
##D corpus <- tm_map(crude, stripWhitespace) # some pre-processing
##D corpus <- tm_map(corpus, content_transformer(tolower))
##D corpus <- tm_map(corpus, removePunctuation)
##D corpus <- tm_map(corpus, removeWords, stopwords("english"))
##D 
##D cat(as.character(corpus[[1]]), "\n") # pre-processed text
##D 
##D dtm <- DocumentTermMatrix(corpus) # document-term matrix
##D inspect(dtm[1:5, 90:99])   # rows = documents
##D 
##D wordspace_dtm <- as.dsm(dtm, verbose=TRUE) # convert to DSM
##D print(wordspace_dtm$S[1:5, 90:99]) # same part of dtm as above
##D 
##D wordspace_tdm <- t(wordspace_dtm) # convert to term-document matrix
##D print(wordspace_tdm)
## End(Not run)




