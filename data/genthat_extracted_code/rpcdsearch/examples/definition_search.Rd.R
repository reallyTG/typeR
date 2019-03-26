library(rpcdsearch)


### Name: definition_search
### Title: This function is used to build new definition lists based on
###   medical definitions
### Aliases: definition_search

### ** Examples

## Not run: 
##D medical_table <- read.delim("medical.txt", fileEncoding="latin1", stringsAsFactors = FALSE)
##D drug_table <- read.delim("product.txt", fileEncoding="latin1", stringsAsFactors = FALSE)
##D def2 <- import_definition_lists(system.file("extdata", "example_search.csv",
##D                                             package = "rpcdsearch"))
##D draft_lists <- definition_search(def2, medical_table, drug_table = drug_table)
## End(Not run)




