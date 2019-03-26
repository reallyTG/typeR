library(ALA4R)


### Name: taxinfo_download
### Title: Download taxonomic data
### Aliases: taxinfo_download

### ** Examples

## Not run: 
##D ## simplest usage
##D x <- taxinfo_download("rk_genus:Heleioporus")
##D 
##D ## Data for Fabaceae with specified fields
##D x <- taxinfo_download("rk_family:Fabaceae", fields=c("guid", "parentGuid", "rk_kingdom",
##D   "rk_phylum", "rk_class", "rk_order", "rk_family", "rk_genus", "scientificName"))
##D 
##D ## equivalent direct URL: http://bie.ala.org.au/ws/download?fields=guid,parentGuid,rk_kingdom,
##D ##    rk_phylum,rk_class,rk_order,rk_family,rk_genus,scientificName&q=rk_family:Fabaceae
## End(Not run)



