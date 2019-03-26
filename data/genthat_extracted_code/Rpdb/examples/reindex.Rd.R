library(Rpdb)


### Name: reindex
### Title: Reinitialize Object Indexing
### Aliases: reindex reindex.atoms reindex.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
x <- subset(x, x$atoms$eleid %in% sample(x$atoms$eleid, 10))
print(x)
x <- reindex(x)
print(x)




