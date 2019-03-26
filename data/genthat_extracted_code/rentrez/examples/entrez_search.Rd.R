library(rentrez)


### Name: entrez_search
### Title: Search the NCBI databases using EUtils
### Aliases: entrez_search

### ** Examples

## Not run: 
##D    query <- "Gastropoda[Organism] AND COI[Gene]"
##D    web_env_search <- entrez_search(db="nuccore", query, use_history=TRUE)
##D    cookie <- web_env_search$WebEnv
##D    qk <- web_env_search$QueryKey 
##D    snail_coi <- entrez_fetch(db = "nuccore", WebEnv = cookie, query_key = qk,
##D                              file_format = "fasta", retmax = 10)
## End(Not run)
## No test: 

fly_id <- entrez_search(db="taxonomy", term="Drosophila")
#Oh, right. There is a genus and a subgenus name Drosophila...
#how can we limit this search
(tax_fields <- entrez_db_searchable("taxonomy"))
#"RANK" loots promising
tax_fields$RANK
entrez_search(db="taxonomy", term="Drosophila & Genus[RANK]")
## End(No test)



