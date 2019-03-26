library(bibliometrix)


### Name: retrievalByAuthorID
### Title: Get Author Content on SCOPUS by ID
### Aliases: retrievalByAuthorID

### ** Examples

## Request a personal API Key to Elsevier web page https://dev.elsevier.com/sc_apis.html

## api_key="your api key"

## create a data frame with the list of authors to get information and IDs
# i.e. df[1,1:3] <- c("aria","massimo","naples")
#      df[2,1:3] <- c("cuccurullo","corrado", "naples")

## run idByAuthor function
#
# authorsID <- idByAuthor(df, api_key)
#

## extract the IDs
# 
# id <- authorsID[,3]
#

## create the bibliographic collection
# 
# res <- retrievalByAuthorID(id, api_key)
#
# M <- res$M  # the entire bibliographic data frame
# M <- res$authorDocuments # the list containing a bibliographic data frame for each author




