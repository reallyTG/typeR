library(rphast)


### Name: read.feat
### Title: Read a Feature File (GFF, BED, or GenePred)
### Aliases: read.feat
### Keywords: BED GFF Genepred features

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
featFile <- "gencode.ENr334-100k.gff"
unzip(exampleArchive, featFile)
f <- read.feat(featFile)
dim(f)
f[1:10,]
unlink(featFile)



