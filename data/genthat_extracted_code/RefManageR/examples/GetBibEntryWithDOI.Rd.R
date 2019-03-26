library(RefManageR)


### Name: GetBibEntryWithDOI
### Title: Lookup a Bibtex entry using a Digital Object Identifier
### Aliases: GetBibEntryWithDOI

### ** Examples

if (interactive() && !httr::http_error("https://doi.org/"))
  GetBibEntryWithDOI(c("10.1016/j.iheduc.2003.11.004", "10.3998/3336451.0004.203"))



