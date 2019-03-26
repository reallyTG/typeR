library(prozor)


### Name: annotatePeptides
### Title: Annotate peptides with protein ids
### Aliases: annotatePeptides

### ** Examples

library(prozor)
data(pepprot)
file = system.file("extdata/shortfasta.fasta.gz",package = "prozor")

fasta = readPeptideFasta(file = file)
res = annotatePeptides(pepprot[1:20,], fasta)
head(res)
res = annotatePeptides(pepprot[1:20,"peptideSeq"],fasta)
length(res)



