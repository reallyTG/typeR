library(taxa)


### Name: taxon_name
### Title: Taxon name class
### Aliases: taxon_name

### ** Examples

(poa <- taxon_name("Poa"))
(undef <- taxon_name("undefined"))
(sp1 <- taxon_name("species 1"))
(poa_annua <- taxon_name("Poa annua"))
(x <- taxon_name("Poa annua L."))

x$name
x$database

(x <- taxon_name(
  "Poa annua",
  database_list$ncbi
))
x$rank
x$database

# a null taxon_name object
taxon_name(NULL)



