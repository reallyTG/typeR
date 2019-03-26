library(phylocomr)


### Name: ph_comtrait
### Title: comtrait
### Aliases: ph_comtrait

### ** Examples

## Not run: 
##D sfile <- system.file("examples/sample_comstruct", package = "phylocomr")
##D tfile <- system.file("examples/traits_aot", package = "phylocomr")
##D 
##D # from files
##D sample_str <- paste0(readLines(sfile), collapse = "\n")
##D sfile2 <- tempfile()
##D cat(sample_str, file = sfile2, sep = '\n')
##D 
##D traits_str <- paste0(readLines(tfile), collapse = "\n")
##D tfile2 <- tempfile()
##D cat(traits_str, file = tfile2, sep = '\n')
##D 
##D ph_comtrait(sample = sfile2, traits = tfile2)
##D 
##D # from data.frame
##D sampledf <- read.table(sfile, header = FALSE,
##D   stringsAsFactors = FALSE)
##D traitsdf_file <- system.file("examples/traits_aot_df",
##D   package = "phylocomr")
##D traitsdf <- read.table(text = readLines(traitsdf_file), header = TRUE,
##D   stringsAsFactors = FALSE)
##D ph_comtrait(sample = sampledf, traits = traitsdf,
##D   binary = c(FALSE, FALSE, FALSE, TRUE))
## End(Not run)



