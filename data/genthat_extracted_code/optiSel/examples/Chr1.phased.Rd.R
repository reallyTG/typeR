library(optiSel)


### Name: Chr1.phased
### Title: Phased Cattle Genotypes from Chromosome 1
### Aliases: Chr1.phased
### Keywords: datasets

### ** Examples

GTfile <- system.file("extdata/Chr1.phased", package="optiSel")
file.show(GTfile)
GT     <- read.table(GTfile, header=TRUE, skip=2, check.names=FALSE)
GT[1:10,1:5]



