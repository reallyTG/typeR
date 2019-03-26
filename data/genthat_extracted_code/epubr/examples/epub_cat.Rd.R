library(epubr)


### Name: epub_cat
### Title: Pretty printing of EPUB text
### Aliases: epub_cat

### ** Examples

file <- system.file("dracula.epub", package = "epubr")
d <- epub(file)
epub_cat(d, max_paragraphs = 2, skip = 147)



