library(RefManageR)


### Name: RelistBibEntry
### Title: Flatten and unflatten BibEntry objects
### Aliases: RelistBibEntry unlist.BibEntry RelistBibEntry
### Keywords: database list manip

### ** Examples

bib <- list(c(bibtype = "article", key = "mclean2014a", title = "My New Article",
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-01"),
  c(bibtype = "article", key = "mclean2014b", title = "My Newer Article",
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-02"))
bib <- as.BibEntry(bib)
unlist(bib)
RelistBibEntry(unlist(bib))



