library(Rdpack)


### Name: makeVignetteReference
### Title: Make bibtex references for vignettes
### Aliases: makeVignetteReference vigbib
### Keywords: bibtex

### ** Examples

vigbib("Rdpack")
makeVignetteReference("Rdpack", vig = 1)
makeVignetteReference("Rdpack", vig = "Inserting_bibtex_references")
## the first few characters of the name suffice:
makeVignetteReference("Rdpack", vig = "Inserting_bib")

## this gives an error but also prints the available vignettes:
## makeVignetteReference("Matrix", vig = "NoSuchVignette")

vigbib("utils")
makeVignetteReference("utils", vig = 1)
## commented out since can be slow:
## high <- installed.packages(priority = "high")
## highbib <- lapply(rownames(high), function(x) try(Rdpack:::vigbib(x, verbose = FALSE)))



