library(rphast)


### Name: split.by.feature.msa
### Title: Split an MSA by feature
### Aliases: split.by.feature.msa
### Keywords: features msa

### ** Examples

require("rphast")
exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
files <- c("ENr334-100k.maf", "gencode.ENr334-100k.gff")
unzip(exampleArchive, files)
m <- read.msa("ENr334-100k.maf")
feats <- read.feat("gencode.ENr334-100k.gff")
feats$seqname <- "hg18"
cdsAlign <- split.by.feature.msa(m, feats[feats$feature=="CDS",])
unlink(files)



