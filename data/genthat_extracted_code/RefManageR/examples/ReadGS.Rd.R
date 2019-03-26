library(RefManageR)


### Name: ReadGS
### Title: Import book and article references from a public Google Scholar
###   profile by ID.
### Aliases: ReadGS
### Keywords: database

### ** Examples

if (interactive() && !httr::http_error("https://scholar.google.com")){
  ## R. J. Carroll's ten newest publications
  ReadGS(scholar.id = "CJOHNoQAAAAJ", limit = 10, sort.by.date = TRUE)

  ## Matthias Katzfu\ss
  BibOptions(check.entries = "warn")
  kat.bib <- ReadGS(scholar.id = "vqW0UqUAAAAJ")

  ## retrieve GS citation counts stored in field 'cites'
  kat.bib$cites
}



