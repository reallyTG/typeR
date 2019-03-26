library(prozor)


### Name: createDecoyDB
### Title: Create db with decoys and contaminants
### Aliases: createDecoyDB

### ** Examples

#file = file.path(path.package("prozor"),"extdata/shortfasta.fasta.gz")
file = system.file("extdata/fgcz_contaminants_20150123.fasta.gz",package = "prozor")
cont <- loadContaminantsFasta()
rabbit <-readPeptideFasta(file)
tmp <- 2*(2*length(rabbit)+length(cont)) + 1

res <- createDecoyDB(c(file,file))
length(res)
tmp
stopifnot(length(res) == tmp)

res <- createDecoyDB(c(file,file), revLab=NULL)
stopifnot(length(res) == (2*length(rabbit)+length(cont) + 1))
res <- createDecoyDB(c(file,file), revLab=NULL, useContaminants = NULL)
stopifnot(length(res) == (2*length(rabbit) + 1) )




