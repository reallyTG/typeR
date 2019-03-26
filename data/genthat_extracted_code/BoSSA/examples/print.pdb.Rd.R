library(BoSSA)


### Name: print.protdb
### Title: Compact display of protdb object
### Aliases: print.protdb

### ** Examples

pdb_file <- system.file("extdata", "1L2M.pdb", package = "BoSSA")
pdb <- read_protdb(pdb_file)
print(pdb)



