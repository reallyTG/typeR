library(RefManageR)


### Name: LookupPubMedID
### Title: Retrieve PubMed ID's for a BibEntry object
### Aliases: LookupPubMedID
### Keywords: database

### ** Examples

if (interactive() && !httr::http_error("https://eutils.ncbi.nlm.nih.gov/")){
  file.name <- system.file("Bib", "RJC.bib", package = "RefManageR")
  bib <- ReadBib(file.name)
  LookupPubMedID(bib[[101:102]])
}



