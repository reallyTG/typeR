library(phylocomr)


### Name: ph_aot
### Title: aot
### Aliases: ph_aot

### ** Examples

traits_file <- system.file("examples/traits_aot", package = "phylocomr")
phylo_file <- system.file("examples/phylo_aot", package = "phylocomr")

# from data.frame
traitsdf_file <- system.file("examples/traits_aot_df",
  package = "phylocomr")
traits <- read.table(text = readLines(traitsdf_file), header = TRUE,
  stringsAsFactors = FALSE)
phylo_str <- readLines(phylo_file)
(res <- ph_aot(traits, phylo = phylo_str))

# from files
traits_str <- paste0(readLines(traits_file), collapse = "\n")
traits_file2 <- tempfile()
cat(traits_str, file = traits_file2, sep = '\n')
phylo_file2 <- tempfile()
cat(phylo_str, file = phylo_file2, sep = '\n')
(res <- ph_aot(traits_file2, phylo_file2))



