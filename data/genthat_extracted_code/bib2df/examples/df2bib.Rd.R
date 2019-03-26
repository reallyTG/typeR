library(bib2df)


### Name: df2bib
### Title: Export a BibTeX 'tibble' to a .bib file
### Aliases: df2bib

### ** Examples

# Read from .bib file:
path <- system.file("extdata", "biblio.bib", package = "bib2df")
bib <- bib2df(path)

# Write to .bib file:
bibFile <- tempfile()
df2bib(bib, bibFile)

# Use `append = TRUE` to add lines to an existing .bib file:
df2bib(bib, bibFile, append = TRUE)



