library(phylocomr)


### Name: ph_phylomatic
### Title: phylomatic
### Aliases: ph_phylomatic

### ** Examples

taxa_file <- system.file("examples/taxa", package = "phylocomr")
phylo_file <- system.file("examples/phylo", package = "phylocomr")

# from strings
(taxa_str <- readLines(taxa_file))
(phylo_str <- readLines(phylo_file))
(tree <- ph_phylomatic(taxa = taxa_str, phylo = phylo_str))

# from files
taxa_file2 <- tempfile()
cat(taxa_str, file = taxa_file2, sep = '\n')
phylo_file2 <- tempfile()
cat(phylo_str, file = phylo_file2, sep = '\n')
(tree <- ph_phylomatic(taxa = taxa_file2, phylo = phylo_file2))

if (requireNamespace("ape")) {
  library(ape)
  plot(read.tree(text = tree))
}



