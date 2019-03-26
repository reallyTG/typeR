library(optiSel)


### Name: Chr2.phased
### Title: Phased Cattle Genotypes from Chromosome 2
### Aliases: Chr2.phased
### Keywords: datasets

### ** Examples

GTfile <- system.file("extdata/Chr2.phased", package="optiSel")
file.show(GTfile)
GT <- read.table(GTfile, header=TRUE, skip=2, check.names=FALSE)
GT[1:10,1:5]



