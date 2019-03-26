library(easyPubMed)


### Name: batch_pubmed_download
### Title: Download PubMed Records in XML or TXT Format
### Aliases: batch_pubmed_download

### ** Examples

## Not run: 
##D # Example 01: retrieve data from PubMed and save as XML file
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out1 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180)
##D XML::xmlParse(out1[1])
##D #
##D # Example 02: retrieve data from PubMed and save as TXT file
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out2 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180, format = "medline")
##D readLines(out2[1])[1:30]
## End(Not run)



