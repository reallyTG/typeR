library(easyPubMed)


### Name: article_to_df
### Title: Extract Data from a PubMed Record
### Aliases: article_to_df

### ** Examples

#
# Query PubMed, retrieve a selected citation and format it as a data frame
dami_query <- "Damiano Fantini[AU] AND 2017[PDAT]"
dami_on_pubmed <- get_pubmed_ids(dami_query)
dami_abstracts_xml <- fetch_pubmed_data(dami_on_pubmed)
dami_abstracts_list <- articles_to_list(dami_abstracts_xml)
article_to_df(pubmedArticle = dami_abstracts_list[[1]], autofill = FALSE)
article_to_df(pubmedArticle = dami_abstracts_list[[2]], autofill = TRUE, max_chars = 300)[1:2,]



