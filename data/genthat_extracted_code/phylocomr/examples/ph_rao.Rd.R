library(phylocomr)


### Name: ph_rao
### Title: rao - Rao's quadratic entropy
### Aliases: ph_rao

### ** Examples

sfile <- system.file("examples/sample_comstruct", package = "phylocomr")
pfile <- system.file("examples/phylo_comstruct", package = "phylocomr")

# sample from data.frame, phylogeny from a string
sampledf <- read.table(sfile, header = FALSE,
  stringsAsFactors = FALSE)
phylo_str <- readLines(pfile)

ph_rao(sample = sampledf, phylo = phylo_str)

# both from files
sample_str <- paste0(readLines(sfile), collapse = "\n")
sfile2 <- tempfile()
cat(sample_str, file = sfile2, sep = '\n')
pfile2 <- tempfile()
phylo_str <- readLines(pfile)
cat(phylo_str, file = pfile2, sep = '\n')

ph_rao(sample = sfile2, phylo = pfile2)



