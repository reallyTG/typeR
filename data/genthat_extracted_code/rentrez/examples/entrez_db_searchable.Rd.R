library(rentrez)


### Name: entrez_db_searchable
### Title: List available search fields for a given database
### Aliases: entrez_db_searchable

### ** Examples

## No test: 
pmc_fields <- entrez_db_searchable("pmc")
pmc_fields[["AFFL"]]
entrez_search(db="pmc", term="Otago[AFFL]", retmax=0)
entrez_search(db="pmc", term="Auckland[AFFL]", retmax=0)

sra_fields <- entrez_db_searchable("sra")
as.data.frame(sra_fields)
## End(No test)



