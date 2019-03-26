library(RefManageR)


### Name: WriteBib
### Title: Create a BibTeX File from a BibEntry Object e Creates a Bibtex
###   File from a BibEntry object for use with either BibTeX or BibLaTex.
### Aliases: WriteBib
### Keywords: IO

### ** Examples

bib <- ReadCrossRef(query = '10.1080/01621459.2012.699793')
## Write bib if no server error
if (length(bib)){
  tfile <- tempfile(fileext = ".bib")
  WriteBib(bib, tfile, biblatex = TRUE)
  identical(ReadBib(tfile), bib)
  unlink(tfile)
}



