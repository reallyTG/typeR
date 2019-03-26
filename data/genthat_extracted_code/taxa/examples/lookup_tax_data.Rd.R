library(taxa)


### Name: lookup_tax_data
### Title: Convert one or more data sets to taxmap
### Aliases: lookup_tax_data

### ** Examples

## Not run: 
##D 
##D   # Look up taxon names in vector from NCBI
##D   lookup_tax_data(c("homo sapiens", "felis catus", "Solanaceae"),
##D                   type = "taxon_name")
##D 
##D   # Look up taxon names in list from NCBI
##D   lookup_tax_data(list("homo sapiens", "felis catus", "Solanaceae"),
##D                   type = "taxon_name")
##D 
##D   # Look up taxon names in table from NCBI
##D   my_table <- data.frame(name = c("homo sapiens", "felis catus"),
##D                          decency = c("meh", "good"))
##D   lookup_tax_data(my_table, type = "taxon_name", column = "name")
##D 
##D   # Look up taxon names from NCBI with fuzzy matching
##D   lookup_tax_data(c("homo sapienss", "feles catus", "Solanacese"),
##D                   type = "fuzzy_name")
##D 
##D   # Look up taxon names from a different database
##D   lookup_tax_data(c("homo sapiens", "felis catus", "Solanaceae"),
##D                   type = "taxon_name", database = "ITIS")
##D 
##D   # Prevent asking questions for ambiguous taxon names
##D   lookup_tax_data(c("homo sapiens", "felis catus", "Solanaceae"),
##D                   type = "taxon_name", database = "ITIS", ask = FALSE)
##D 
##D   # Look up taxon IDs from NCBI
##D   lookup_tax_data(c("9689", "9694", "9643"), type = "taxon_id")
##D 
##D   # Look up sequence IDs from NCBI
##D   lookup_tax_data(c("AB548412", "FJ358423", "DQ334818"),
##D                   type = "seq_id")
##D 
##D   # Make up new taxon IDs instead of using the downloaded ones
##D   lookup_tax_data(c("AB548412", "FJ358423", "DQ334818"),
##D                   type = "seq_id", use_database_ids = FALSE)
##D 
##D 
##D   # --- Parsing multiple datasets at once (advanced) ---
##D   # The rest is one example for how to classify multiple datasets at once.
##D 
##D   # Make example data with taxonomic classifications
##D   species_data <- data.frame(tax = c("Mammalia;Carnivora;Felidae",
##D                                      "Mammalia;Carnivora;Felidae",
##D                                      "Mammalia;Carnivora;Ursidae"),
##D                              species = c("Panthera leo",
##D                                          "Panthera tigris",
##D                                          "Ursus americanus"),
##D                              species_id = c("A", "B", "C"))
##D 
##D   # Make example data associated with the taxonomic data
##D   # Note how this does not contain classifications, but
##D   # does have a varaible in common with "species_data" ("id" = "species_id")
##D   abundance <- data.frame(id = c("A", "B", "C", "A", "B", "C"),
##D                           sample_id = c(1, 1, 1, 2, 2, 2),
##D                           counts = c(23, 4, 3, 34, 5, 13))
##D 
##D   # Make another related data set named by species id
##D   common_names <- c(A = "Lion", B = "Tiger", C = "Bear", "Oh my!")
##D 
##D   # Make another related data set with no names
##D   foods <- list(c("ungulates", "boar"),
##D                 c("ungulates", "boar"),
##D                 c("salmon", "fruit", "nuts"))
##D 
##D   # Make a taxmap object with these three datasets
##D   x = lookup_tax_data(species_data,
##D                       type = "taxon_name",
##D                       datasets = list(counts = abundance,
##D                                       my_names = common_names,
##D                                       foods = foods),
##D                       mappings = c("species_id" = "id",
##D                                    "species_id" = "{{name}}",
##D                                    "{{index}}" = "{{index}}"),
##D                       column = "species")
##D 
##D   # Note how all the datasets have taxon ids now
##D   x$data
##D 
##D   # This allows for complex mappings between variables that other functions use
##D   map_data(x, my_names, foods)
##D   map_data(x, counts, my_names)
## End(Not run)



