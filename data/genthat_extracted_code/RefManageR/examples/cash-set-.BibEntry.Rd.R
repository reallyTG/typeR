library(RefManageR)


### Name: $<-.BibEntry
### Title: Replace values for a particular field in a BibEntry object
### Aliases: $<-.BibEntry
### Keywords: methods

### ** Examples

bib <- BibEntry(bibtype = "misc", key = "mclean", author = "Mathew W. McLean", 
  title = "My Work", year = "2012")
bib$year <- 2014
bib$author <- "McLean, M. W. and Carroll, R. J." 
bib$url <- "https://example.com"
bib

bib <- c(bib, as.BibEntry(citation()))
bib[1]$author[2] <- person(c("Raymond", "J."), "Carroll")
bib$author



