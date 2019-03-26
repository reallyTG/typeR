library(easyPubMed)


### Name: articles_to_list
### Title: Cast PubMed Data into a List of Articles
### Aliases: articles_to_list

### ** Examples

#
# retrieve PubMed data and return a list ot articles
dami_query <- "Damiano Fantini[AU]"
outfile <- batch_pubmed_download(dami_query, dest_file_prefix = "easyPM_ex001_")
listed_articles <- articles_to_list(pubmed_data = outfile)
listed_articles[[3]]



