library(prozor)


### Name: annotateVec
### Title: annotate vector of petpide sequences against fasta file
###   (Deprecated)
### Aliases: annotateVec

### ** Examples


library(prozor)
file = system.file("extdata/shortfasta.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)

res = annotateVec(pepprot[1:20,"peptideSeq"],fasta)
head(res)



