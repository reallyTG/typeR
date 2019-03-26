library(bib2df)


### Name: bib2df
### Title: Parse a BibTeX file to a 'tibble'
### Aliases: bib2df

### ** Examples

# Read from .bib file:
path <- system.file("extdata", "biblio.bib", package = "bib2df")
bib <- bib2df(path)
str(bib)

# Read from .bib file and separate authors' and editors' names:
bib <- bib2df(path, separate_names = TRUE)
str(bib)



