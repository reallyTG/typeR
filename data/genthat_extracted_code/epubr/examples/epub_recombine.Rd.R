library(epubr)


### Name: epub_recombine
### Title: Recombine text sections
### Aliases: epub_recombine

### ** Examples

file <- system.file("dracula.epub", package = "epubr")
x <- epub(file) # parse entire e-book
x$data[[1]] # note arbitrary section breaks (not between chapters)

pat <- "CHAPTER [IVX]+" # but a reliable pattern exists for new breaks
epub_recombine(x, pat) # not quite as expected; pattern also appears in table of contents!

epub_recombine(x, pat, sift = list(n = 1000)) # also sift low word-count sections



