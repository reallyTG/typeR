library(caRpools)


### Name: carpools.reads.genedesigns
### Title: QC: Plot representation of sgRNAs per gene
### Aliases: carpools.reads.genedesigns
### Keywords: ~coverage ~sgRNA

### ** Examples

data(caRpools)

control1.readspergene = carpools.reads.genedesigns(CONTROL1, namecolumn=1, fullmatchcolumn=2,
title=paste("sgRNA Represenation:", d.CONTROL1, sep=" "),
xlab="Percentage of sgRNAs present", ylab="# of Genes")




