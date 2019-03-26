library(taxa)


### Name: extract_tax_data
### Title: Extracts taxonomy info from vectors with regex
### Aliases: extract_tax_data

### ** Examples


## Not run: 
##D 
##D   # For demonstration purposes, the following example dataset has all the
##D   # types of data that can be used, but any one of them alone would work.
##D   raw_data <- c(
##D   ">id:AB548412-tid:9689-Panthera leo-tax:K_Mammalia;P_Carnivora;C_Felidae;G_Panthera;S_leo",
##D   ">id:FJ358423-tid:9694-Panthera tigris-tax:K_Mammalia;P_Carnivora;C_Felidae;G_Panthera;S_tigris",
##D   ">id:DQ334818-tid:9643-Ursus americanus-tax:K_Mammalia;P_Carnivora;C_Felidae;G_Ursus;S_americanus"
##D   )
##D 
##D   # Build a taxmap object from classifications
##D   extract_tax_data(raw_data,
##D                    key = c(my_seq = "info", my_tid = "info", org = "info", tax = "class"),
##D                    regex = "^>id:(.+)-tid:(.+)-(.+)-tax:(.+)$",
##D                    class_sep = ";", class_regex = "^(.+)_(.+)$",
##D                    class_key = c(my_rank = "info", tax_name = "taxon_name"))
##D 
##D   # Build a taxmap object from taxon ids
##D   # Note: this requires an internet connection
##D   extract_tax_data(raw_data,
##D                    key = c(my_seq = "info", my_tid = "taxon_id", org = "info", tax = "info"),
##D                    regex = "^>id:(.+)-tid:(.+)-(.+)-tax:(.+)$")
##D 
##D   # Build a taxmap object from ncbi sequence accession numbers
##D   # Note: this requires an internet connection
##D   extract_tax_data(raw_data,
##D                    key = c(my_seq = "seq_id", my_tid = "info", org = "info", tax = "info"),
##D                    regex = "^>id:(.+)-tid:(.+)-(.+)-tax:(.+)$")
##D 
##D   # Build a taxmap object from taxon names
##D   # Note: this requires an internet connection
##D   extract_tax_data(raw_data,
##D                    key = c(my_seq = "info", my_tid = "info", org = "taxon_name", tax = "info"),
##D                    regex = "^>id:(.+)-tid:(.+)-(.+)-tax:(.+)$")
## End(Not run)



