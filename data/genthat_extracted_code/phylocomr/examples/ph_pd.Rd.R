library(phylocomr)


### Name: ph_pd
### Title: pd - Faith's index of phylogenetic diversity
### Aliases: ph_pd

### ** Examples

sfile <- system.file("examples/sample_comstruct", package = "phylocomr")
pfile <- system.file("examples/phylo_comstruct", package = "phylocomr")

# from data.frame
sampledf <- read.table(sfile, header = FALSE,
  stringsAsFactors = FALSE)
phylo_str <- readLines(pfile)
ph_pd(sample = sampledf, phylo = phylo_str)

# from files
sample_str <- paste0(readLines(sfile), collapse = "\n")
sfile2 <- tempfile()
cat(sample_str, file = sfile2, sep = '\n')
pfile2 <- tempfile()
phylo_str <- readLines(pfile)
cat(phylo_str, file = pfile2, sep = '\n')

ph_pd(sample = sfile2, phylo = pfile2)



