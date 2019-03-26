library(prozor)


### Name: annotateAHO
### Title: annotate peptides using AhoCorasickTrie
### Aliases: annotateAHO

### ** Examples


library(prozor)
file = system.file("extdata/shortfasta.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)
pepprot <- get(data("pepprot", package = "prozor"))
system.time( res2 <- annotateAHO( pepprot[1:20,"peptideSeq"], fasta))
colnames(res2)



