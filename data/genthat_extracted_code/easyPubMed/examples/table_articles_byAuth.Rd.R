library(easyPubMed)


### Name: table_articles_byAuth
### Title: Extract Publication and Affiliation Data from PubMed Records
### Aliases: table_articles_byAuth

### ** Examples

## Not run: 
##D #
##D #
##D dami_query <- "Damiano Fantini[AU]"
##D dami_on_pubmed <- get_pubmed_ids(dami_query)
##D dami_abstracts_xml <- fetch_pubmed_data(dami_on_pubmed)
##D table_articles_byAuth(pubmed_data = dami_abstracts_xml, 
##D                       included_authors = "first", 
##D                       max_chars = 100, 
##D                       autofill = TRUE)[1:2,]
##D #
##D #
##D dami_query <- "Damiano Fantini[AU]"
##D curr.file <- batch_pubmed_download(dami_query, dest_file_prefix = "test_bpd_")
##D table_articles_byAuth(pubmed_data = curr.file[1], 
##D                       included_authors = "all", 
##D                       max_chars = 20, 
##D                       autofill =FALSE)
## End(Not run)



