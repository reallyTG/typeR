library(rphast)


### Name: add.introns.feat
### Title: Add introns to features
### Aliases: add.introns.feat
### Keywords: features

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
featFile <- "gencode.ENr334.gp"
unzip(exampleArchive, featFile)
f <- read.feat(featFile)
table(f$feature)
coverage.feat(f[f$feature=="CDS",])
coverage.feat(f[f$feature=="exon",])
f <- add.introns.feat(f)
table(f$feature)
coverage.feat(f[f$feature=="intron",])
unlink(featFile)



