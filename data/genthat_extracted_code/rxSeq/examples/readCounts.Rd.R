library(rxSeq)


### Name: readCounts
### Title: A list object that should be used as input to optimization
###   process function.
### Aliases: readCounts
### Keywords: utilities

### ** Examples

# see total read counts (TReC) for first 2 X chromosome genes of a data example:
rcA = readCounts(index=data.A$index, y=data.A$y[1:2,], n=data.A$n[1:2,], n0B=data.A$n0B[1:2,], 
                 kappas=data.A$kappas, geneids=data.A$geneids[1:2])



