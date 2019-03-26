library(brranching)


### Name: rbladj
### Title: Run Phylocom's bladj from R
### Aliases: rbladj

### ** Examples

## Not run: 
##D library("phylocomr")
##D 
##D # make an ages data.frame
##D ages_df <- data.frame(
##D   a = c('malpighiales','eudicots','ericales_to_asterales','plantaginaceae',
##D         'malvids', 'poales'),
##D   b = c(81, 20, 56, 76, 47, 71)
##D )
##D 
##D # read phylogeny file as a string
##D phylo_file <- system.file("examples/phylo_bladj", package = "phylocomr")
##D phylo_str <- readLines(phylo_file)
##D 
##D # Run Bladj, returns phylo object
##D (x <- rbladj(tree = phylo_str, ages = ages_df))
##D 
##D # load ape and plot tree
##D library(ape)
##D plot(x)
## End(Not run)



