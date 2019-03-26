library(phylocomr)


### Name: ph_comstruct
### Title: comstruct
### Aliases: ph_comstruct

### ** Examples

sfile <- system.file("examples/sample_comstruct", package = "phylocomr")
pfile <- system.file("examples/phylo_comstruct", package = "phylocomr")

# from data.frame
sampledf <- read.table(sfile, header = FALSE,
  stringsAsFactors = FALSE)
phylo_str <- readLines(pfile)
(res <- ph_comstruct(sample = sampledf, phylo = phylo_str))

# from files
sample_str <- paste0(readLines(sfile), collapse = "\n")
sfile2 <- tempfile()
cat(sample_str, file = sfile2, sep = '\n')
pfile2 <- tempfile()
cat(phylo_str, file = pfile2, sep = '\n')
(res <- ph_comstruct(sample = sfile2, phylo = pfile2))

# different null models
ph_comstruct(sample = sfile2, phylo = pfile2, null_model = 0)
ph_comstruct(sample = sfile2, phylo = pfile2, null_model = 1)
ph_comstruct(sample = sfile2, phylo = pfile2, null_model = 2)
# ph_comstruct(sample = sfile2, phylo = pfile2, null_model = 3)



