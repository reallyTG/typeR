library(reutils)


### Name: reutils-package
### Title: Talk to the NCBI EUtils
### Aliases: reutils reutils-package

### ** Examples

#
# combine esearch and efetch
#
# Download PubMed records that are indexed in MeSH for both 'Chlamydia' and 
# 'genome' and were published in 2013.
query <- "Chlamydia[mesh] and genome[mesh] and 2013[pdat]"

# Upload the PMIDs for this search to the History server
pmids <- esearch(query, "pubmed", usehistory = TRUE)
pmids

## Not run: 
##D # Fetch the records
##D articles <- efetch(pmids)
##D 
##D # Use XPath expressions with the #xmlValue() or #xmlAttr() methods to directly
##D # extract specific data from the XML records stored in the 'efetch' object.
##D titles <- articles$xmlValue("//ArticleTitle")
##D abstracts <- articles$xmlValue("//AbstractText")
##D 
##D #
##D # combine epost with esummary/efetch
##D #
##D # Download protein records corresponding to a list of GI numbers.
##D uid <- c("194680922", "50978626", "28558982", "9507199", "6678417")
##D 
##D # post the GI numbers to the Entrez history server
##D p <- epost(uid, "protein")
##D 
##D # retrieve docsums with esummary
##D docsum <- content(esummary(p, version = "1.0"), "parsed")
##D docsum
##D 
##D # download FASTAs as 'text' with efetch
##D prot <- efetch(p, retmode = "text", rettype = "fasta")
##D prot
##D 
##D # retrieve the content from the efetch object
##D fasta <- content(prot)
## End(Not run)



