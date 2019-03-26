library(genoPlotR)


### Name: reverse
### Title: Reverse objects
### Aliases: reverse reverse.default reverse.dna_seg reverse.comparison
### Keywords: data

### ** Examples

## load data
data(three_genes)

## on dna_seg
dna_segs[[1]]
reverse(dna_segs[[1]])
## on comparison
reverse(comparisons[[2]], side=1)
reverse(comparisons[[2]], side=3)

## With mauve backbone
data(mauve_bbone)
## Plot
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons)

## Reverse B_bacilliformis, and the corresponding comparison (first "side")
bbone$dna_segs[[1]] <- reverse(bbone$dna_segs[[1]])
bbone$comparisons[[1]] <- reverse(bbone$comparisons[[1]], 1)
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons)




