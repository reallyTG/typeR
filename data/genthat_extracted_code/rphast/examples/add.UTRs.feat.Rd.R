library(rphast)


### Name: add.UTRs.feat
### Title: Add UTRs to features
### Aliases: add.UTRs.feat
### Keywords: features

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
featFile <- "gencode.ENr334.gp"
unzip(exampleArchive, featFile)
f <- read.feat(featFile)
table(f$feature)
coverage.feat(f[f$feature=="CDS",])
coverage.feat(f[f$feature=="exon",])
f <- add.UTRs.feat(f)
table(f$feature)
coverage.feat(f[f$feature=="3'UTR",])
coverage.feat(f[f$feature=="5'UTR",])
unlink(featFile)



