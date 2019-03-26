library(easyPubMed)


### Name: easyPubMed-package
### Title: Retrieve and Process Scientific Publication Records from Pubmed
### Aliases: easyPubMed-package easyPubMed

### ** Examples

# Example 01: retrieve data in XML format
dami_query_string <- "Damiano Fantini[AU]"
dami_on_pubmed <- get_pubmed_ids(dami_query_string)
dami_papers <- fetch_pubmed_data(dami_on_pubmed)
titles <- unlist(xpathApply(dami_papers, "//ArticleTitle", saveXML))
title_pos <- regexpr('<ArticleTitle>.*<\\/ArticleTitle>', titles)
titles <- substr(titles, title_pos + 14, title_pos + attributes(title_pos)$match.length - 16)
print(titles)
#
# Example 02: retrieve data in TXT format
dami_query_string <- "Damiano Fantini[AU]"
dami_on_pubmed <- get_pubmed_ids(dami_query_string)
dami_papers <- fetch_pubmed_data(dami_on_pubmed, format = "abstract")
dami_papers[dami_papers == ""] <- "\n"
cat(paste(dami_papers[1:65], collapse = ""))
#
## Not run: 
##D # Example 03: retrieve data from PubMed and save as XML file
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out1 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180)
##D XML::xmlParse(out1[1])
##D #
##D # Example 04: retrieve data from PubMed and save as TXT file
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out2 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180, format = "medline")
##D readLines(out2[1])[1:30]
##D #
##D # Example 05: extract information from a single PubMed record 
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out3 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180)
##D PM_data <- articles_to_list(out3[1])
##D PM_record_df <- article_to_df(PM_data[[100]])
##D print(PM_record_df[1,])
##D print(PM_record_df[,"address"])
##D #
##D # Example 06: query PubMed and extract information from multiple records in one step 
##D ml_query <- "Machine Learning[TI] AND 2016[PD]"
##D out4 <- batch_pubmed_download(pubmed_query_string = ml_query, batch_size = 180)
##D PM_tab <- table_articles_byAuth(out4[1], autofill = TRUE, included_authors = "last")
##D PM_tab$address <- substr(PM_tab$address, 1, 15)
##D PM_tab[50:70,c("pmid", "jabbrv", "year", "lastname", "address")]
##D #
## End(Not run)



