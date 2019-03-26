library(rdflib)


### Name: read_nquads
### Title: read an nquads file
### Aliases: read_nquads

### ** Examples

tmp <- tempfile(fileext = ".nq")
library(datasets)
write_nquads(iris, tmp)
read_nquads(tmp)




