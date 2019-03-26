library(RefManageR)


### Name: BibOptions
### Title: Set options/hooks for RefManageR
### Aliases: BibOptions

### ** Examples

BibOptions()
BibOptions("first.inits", "bib.style")

oldopts <- BibOptions(first.inits = FALSE, bib.style = "authoryear")
oldopts
BibOptions(oldopts)

BibOptions(restore.defaults = TRUE)



