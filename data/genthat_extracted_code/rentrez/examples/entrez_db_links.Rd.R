library(rentrez)


### Name: entrez_db_links
### Title: List available links for records from a given NCBI database
### Aliases: entrez_db_links

### ** Examples

## No test: 
taxid <- entrez_search(db="taxonomy", term="Osmeriformes")$ids
tax_links <- entrez_db_links("taxonomy")
tax_links
entrez_link(dbfrom="taxonomy", db="pmc", id=taxid)

sra_links <- entrez_db_links("sra")
as.data.frame(sra_links)
## End(No test)



