library(seqminer)


### Name: annotateVcf
### Title: Annotate a VCF file
### Aliases: annotateVcf

### ** Examples

param <- list(reference = system.file("tabanno/test.fa", package = "seqminer"),
              geneFile = system.file("tabanno/test.gene.txt", package = "seqminer"))
param <- makeAnnotationParameter(param)
inVcf <- system.file("tabanno/input.test.vcf", package = "seqminer")
outVcf <- paste0(getwd(), "/", "out.vcf")
annotateVcf (inVcf, outVcf, param)



