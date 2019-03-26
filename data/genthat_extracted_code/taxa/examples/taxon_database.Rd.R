library(taxa)


### Name: taxon_database
### Title: Taxonomy database class
### Aliases: taxon_database

### ** Examples

# create a database entry
(x <- taxon_database(
  "ncbi",
  "http://www.ncbi.nlm.nih.gov/taxonomy",
  "NCBI Taxonomy Database",
  "*"
))
x$name
x$url

# use pre-created database objects
database_list
database_list$ncbi



