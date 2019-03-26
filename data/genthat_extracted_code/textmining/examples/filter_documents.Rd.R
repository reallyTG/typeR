library(textmining)


### Name: filter_documents
### Title: Function to filter tagged text
### Aliases: filter_documents

### ** Examples

## Not run: 
##D library(dplyr)
##D library(textmining)
##D corp <- tmCorpus(c("This is corp corp", "Document 2 corp corp"))
##D rd <- tmTaggedCorpus(corp)
##D filtered_tmTaggedCorpus <- filter_documents(rd, "tag", "NP")
##D corpus <- tmCorpus(filtered_tmTaggedCorpus)
## End(Not run)




