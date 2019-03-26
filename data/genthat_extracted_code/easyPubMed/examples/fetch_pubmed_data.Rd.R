library(easyPubMed)


### Name: fetch_pubmed_data
### Title: Retrieve PubMed Data in XML or TXT Format
### Aliases: fetch_pubmed_data

### ** Examples

## Not run: 
##D # Example 01: retrieve data in XML format
##D dami_query_string <- "Damiano Fantini[AU]"
##D dami_on_pubmed <- get_pubmed_ids(dami_query_string)
##D dami_papers <- fetch_pubmed_data(dami_on_pubmed)
##D titles <- unlist(xpathApply(dami_papers, "//ArticleTitle", saveXML))
##D title_pos <- regexpr("<ArticleTitle>.*<\\/ArticleTitle>", titles)
##D titles <- substr(titles, title_pos + 14, title_pos + attributes(title_pos)$match.length - 16)
##D print(titles)
##D #
## End(Not run)
# Example 02: retrieve data in TXT format
dami_query_string <- "Damiano Fantini[AU]"
dami_on_pubmed <- get_pubmed_ids(dami_query_string)
dami_papers <- fetch_pubmed_data(dami_on_pubmed, format = "abstract")
dami_papers[dami_papers == ""] <- "\n"
cat(paste(dami_papers[1:65], collapse = ""))



