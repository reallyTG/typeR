library(RefManageR)


### Name: ReadPubMed
### Title: Search NCBI's E-Utilities for citation information
### Aliases: ReadPubMed

### ** Examples

if (interactive() && !httr::http_error("https://eutils.ncbi.nlm.nih.gov/"))
  ReadPubMed(query = "raymond carroll measurement error", retmax = 5, mindate = 1990)



