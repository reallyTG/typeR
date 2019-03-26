library(seqminer)


### Name: annotateGene
### Title: Annotate a test variant
### Aliases: annotateGene

### ** Examples

if (.Platform$endian == "little") {
  param <- list(reference = system.file("tabanno/test.fa", package = "seqminer"),
                geneFile = system.file("tabanno/test.gene.txt", package = "seqminer"))
  param <- makeAnnotationParameter(param)
  print(param)
  annotateGene(param, c("1", "1"), c(3, 5) , c("A", "C"), c("G", "C"))
} else {
  message("Tabix does not work well for big endian for now")
}



