library(phylocomr)


### Name: ph_bladj
### Title: bladj
### Aliases: ph_bladj

### ** Examples

## Not run: 
##D ages_file <- system.file("examples/ages", package = "phylocomr")
##D phylo_file <- system.file("examples/phylo_bladj", package = "phylocomr")
##D 
##D # from data.frame
##D ages_df <- data.frame(
##D   a = c('malpighiales','eudicots','ericales_to_asterales','plantaginaceae',
##D         'malvids', 'poales'),
##D   b = c(81, 20, 56, 76, 47, 71)
##D )
##D phylo_str <- readLines(phylo_file)
##D (res <- ph_bladj(ages = ages_df, phylo = phylo_str))
##D if (requireNamespace("ape")) {
##D   library(ape)
##D   plot(read.tree(text = res))
##D }
##D 
##D # from files
##D ages_file2 <- file.path(tempdir(), "ages")
##D write.table(ages_df, file = ages_file2, row.names = FALSE,
##D   col.names = FALSE, quote = FALSE)
##D phylo_file2 <- tempfile()
##D cat(phylo_str, file = phylo_file2, sep = '\n')
##D (res <- ph_bladj(ages_file2, phylo_file2))
##D if (requireNamespace("ape")) {
##D   library(ape)
##D   plot(read.tree(text = res))
##D }
##D 
##D # using a ape phylo phylogeny object
##D x <- read.tree(text = phylo_str)
##D if (requireNamespace("ape")) {
##D   library(ape)
##D   plot(x)
##D }
##D 
##D (res <- ph_bladj(ages_file2, x))
##D if (requireNamespace("ape")) {
##D   library(ape)
##D   tree <- read.tree(text = res)
##D   plot(tree)
##D }
## End(Not run)



