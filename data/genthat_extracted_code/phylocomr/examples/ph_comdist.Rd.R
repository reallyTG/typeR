library(phylocomr)


### Name: ph_comdist
### Title: comdist
### Aliases: ph_comdist ph_comdistnt

### ** Examples

sfile <- system.file("examples/sample_comstruct", package = "phylocomr")
pfile <- system.file("examples/phylo_comstruct", package = "phylocomr")

# from data.frame
sampledf <- read.table(sfile, header = FALSE,
  stringsAsFactors = FALSE)
phylo_str <- readLines(pfile)
ph_comdist(sample = sampledf, phylo = phylo_str)
ph_comdistnt(sample = sampledf, phylo = phylo_str)
ph_comdist(sample = sampledf, phylo = phylo_str, rand_test = TRUE)
ph_comdistnt(sample = sampledf, phylo = phylo_str, rand_test = TRUE)

# from files
sample_str <- paste0(readLines(sfile), collapse = "\n")
sfile2 <- tempfile()
cat(sample_str, file = sfile2, sep = '\n')
pfile2 <- tempfile()
cat(phylo_str, file = pfile2, sep = '\n')
ph_comdist(sample = sfile2, phylo = pfile2)
ph_comdistnt(sample = sfile2, phylo = pfile2)
ph_comdist(sample = sfile2, phylo = pfile2, rand_test = TRUE)
ph_comdistnt(sample = sfile2, phylo = pfile2, rand_test = TRUE)



