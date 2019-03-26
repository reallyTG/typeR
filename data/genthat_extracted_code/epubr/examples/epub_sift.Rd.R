library(epubr)


### Name: epub_sift
### Title: Sift EPUB sections
### Aliases: epub_sift

### ** Examples

file <- system.file("dracula.epub", package = "epubr")
x <- epub(file) # parse entire e-book
x$data[[1]]

x <- epub_sift(x, n = 3000) # drops last two sections
x$data[[1]]



