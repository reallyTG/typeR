library(seqminer)


### Name: annotatePlain
### Title: Annotate a plain text file
### Aliases: annotatePlain

### ** Examples

param <- list(reference = system.file("tabanno/test.fa", package = "seqminer"),
              geneFile = system.file("tabanno/test.gene.txt", package = "seqminer"),
              inputFormat = "plain")
param <- makeAnnotationParameter(param)
inFile <- system.file("tabanno/input.test.plain.txt", package = "seqminer")
outFile <- paste0(getwd(), "/", "out.annotated.txt")
annotatePlain(inFile, outFile, param)



