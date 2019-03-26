library(RefManageR)


### Name: GetPubMedByID
### Title: Retrieve citation information from NCBI's Entrez for a set of
###   PubMed IDs
### Aliases: GetPubMedByID
### Keywords: database

### ** Examples

if (interactive() && !httr::http_error("https://eutils.ncbi.nlm.nih.gov/"))
  GetPubMedByID(c("11209037", "21245076"))



