library(RefManageR)


### Name: +.BibEntry
### Title: Merge two BibEntry objects while discarding duplicates
### Aliases: +.BibEntry merge.BibEntry +.BibEntry
### Keywords: methods

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
bib1 <- bib[seq_len(44)]
bib2 <- bib[45:length(bib)]

## The following is FALSE because the parent entry of one entry in bib1
##   is in bib2, so the child entry is expanded in the BibEntry object
##   returned by `[` to include the fields inherited from the dropped parent
identical(merge(bib1, bib2, 'all'), bib)
toBiblatex(bib1[[1L]])
toBiblatex(bib[[1L]])

## Alternatively, the operator `[[` for BibEntry objects does not expand
##   cross references
bib1 <- bib[[seq_len(44)]]
bib2 <- bib[[45:length(bib)]]
identical(merge(bib1, bib2, 'all'), bib)

## Not strict enough
invisible(merge(bib1, bib2, c('title', 'date')))

## New publications of R.J. Carroll from Google Scholar and Crossref
## Not run: 
##D bib1 <- ReadGS(scholar.id = "CJOHNoQAAAAJ", limit = '10', sort.by.date = TRUE)
##D bib2 <- ReadCrossRef(query = "rj carroll", limit = 10, sort = "relevance",
##D   min.relevance = 80)
##D oldopt <- BibOptions(merge.fields.to.check = "title")
##D rjc.new.pubs <- bib1 + bib2
##D BibOptions(oldopt)
## End(Not run)



