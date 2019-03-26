library(rpcdsearch)


### Name: export_definition_search
### Title: Exports definition searches to an excel file
### Aliases: export_definition_search

### ** Examples

## Not run: 
##D medical_table <- read.delim("medical.txt", fileEncoding="latin1", stringsAsFactors = FALSE)
##D drug_table <- read.delim("product.txt", fileEncoding="latin1", stringsAsFactors = FALSE)
##D def2 <- import_definition_lists(system.file("extdata", "example_search.csv",
##D                                             package = "rpcdsearch"))
##D draft_lists <- definition_search(def2, medical_table, drug_table = drug_table)
##D out_file <- "def_searches.xlsx"
##D export_definition_search(draft_lists, out_file)
## End(Not run)



