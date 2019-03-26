library(genoPlotR)


### Name: range.dna_seg
### Title: Range calculation
### Aliases: range.dna_seg range.comparison range.annotation
### Keywords: data

### ** Examples

## Load data
data(three_genes)

## On dna_seg
dna_segs[[1]]
range(dna_segs[[1]])

## On comparison
comparisons[[2]]
range(comparisons[[2]])
range(comparisons[[2]], overall=FALSE)



