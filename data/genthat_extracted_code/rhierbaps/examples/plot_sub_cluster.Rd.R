library(rhierbaps)


### Name: plot_sub_cluster
### Title: plot_sub_cluster
### Aliases: plot_sub_cluster

### ** Examples

## No test: 
snp.matrix <- load_fasta(system.file("extdata", "seqs.fa", package = "rhierbaps"))
newick.file.name <- system.file("extdata", "seqs.fa.treefile", package = "rhierbaps")
tree <- phytools::read.newick(newick.file.name)
hb.result <- hierBAPS(snp.matrix, max.depth=2, n.pops=20)
plot_sub_cluster(hb.result, tree, level = 1, sub.cluster = 9)
## End(No test)



