library(rdflib)


### Name: write_nquads
### Title: write object out as nquads
### Aliases: write_nquads

### ** Examples

tmp <- tempfile(fileext = ".nq")
library(datasets)
write_nquads(iris, tmp)
read_nquads(tmp)



