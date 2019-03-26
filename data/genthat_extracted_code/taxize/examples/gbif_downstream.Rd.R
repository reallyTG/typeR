library(taxize)


### Name: gbif_downstream
### Title: Retrieve all taxa names downstream in hierarchy for GBIF
### Aliases: gbif_downstream

### ** Examples

## Not run: 
##D ## the plant class Bangiophyceae
##D gbif_downstream(key = 198, downto="genus")
##D gbif_downstream(key = 198, downto="genus", intermediate=TRUE)
##D 
##D # families downstream from the family Strepsiptera (twisted wing parasites)
##D gbif_downstream(key = 1227, "family")
##D ## here, intermediate leads to the same result as the target
##D gbif_downstream(key = 1227, "family", intermediate=TRUE)
##D 
##D # Lepidoptera
##D gbif_downstream(key = 797, "family")
##D 
##D # get species downstream from the genus Ursus
##D gbif_downstream(key = 2433406, "species")
##D 
##D # get tribes down from the family Apidae
##D gbif_downstream(key = 7799978, downto="species")
##D gbif_downstream(key = 7799978, downto="species", intermediate=TRUE)
##D 
##D # names that don't have canonicalname entries for some results
##D key <- get_gbifid("Myosotis")
##D res <- gbif_downstream(key, downto = "species")
##D res2 <- downstream(key, db = "gbif", downto = "species")
## End(Not run)



