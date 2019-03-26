library(easyPubMed)


### Name: get_pubmed_ids
### Title: Simple PubMed Record Search
### Aliases: get_pubmed_ids

### ** Examples

##  Search for scientific articles written by Damiano Fantini
##  and print the number of retrieved records to screen.
##  Also print the retrieved UIDs to screen.
##
dami_on_pubmed <- get_pubmed_ids("Damiano Fantini[AU]")
print(dami_on_pubmed$Count)
print(unlist(dami_on_pubmed$IdList))



