library(taxize)


### Name: tnrs
### Title: Phylotastic Taxonomic Name Resolution Service.
### Aliases: tnrs

### ** Examples

## Not run: 
##D mynames <- c("Helianthus annuus", "Poa annua", "Mimulus bicolor")
##D tnrs(query = mynames, source = "iPlant_TNRS")
##D 
##D # Specifying the nomenclatural code to match against
##D mynames <- c("Helianthus annuus", "Poa annua")
##D tnrs(query = mynames, code = "ICBN")
##D 
##D # You can specify multiple sources, by comma-separating them
##D mynames <- c("Panthera tigris", "Eutamias minimus", "Magnifera indica",
##D "Humbert humbert")
##D tnrs(query = mynames, source = "NCBI,MSW3")
##D 
##D mynames <- c("Panthera tigris", "Eutamias minimus", "Magnifera indica",
##D    "Humbert humbert", "Helianthus annuus", "Pinus contorta", "Poa annua",
##D    "Abies magnifica", "Rosa california", "Festuca arundinace",
##D    "Mimulus bicolor", "Sorbus occidentalis","Madia sativa", "Thymopsis thymodes",
##D    "Bartlettia scaposa")
##D tnrs(mynames, source = "NCBI")
##D 
##D # Pass on curl options
##D library("httr")
##D mynames <- c("Helianthus annuus", "Poa annua", "Mimulus bicolor")
##D tnrs(query = mynames, source = "iPlant_TNRS", config = verbose())
## End(Not run)



