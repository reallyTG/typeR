library(RefManageR)


### Name: as.BibEntry
### Title: Coerce to a BibEntry object
### Aliases: as.BibEntry is.BibEntry is.BibEntry
### Keywords: utilities

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))[[20:21]]
identical(as.BibEntry(unlist(bib)), bib)  ## see also RelistBibEntry

identical(as.BibEntry(unclass(bib)), bib)

identical(as.BibEntry(as.data.frame(bib)), bib)

bib <- c(bibtype = "article", key = "mclean2014", title = "My New Article",
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-01")
as.BibEntry(bib)

bib <- bibentry(bibtype = "article", key = "mclean2014", title = "My New Article",
journal = "The Journal", year = 2014, author = "Mathew W. McLean")
print(bib, .bibstyle = "JSS")
as.BibEntry(bib)

bib <- list(c(bibtype = "article", key = "mclean2014a", title = "My New Article",
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-01"),
  c(bibtype = "article", key = "mclean2014b", title = "Newer Article",
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-02"))
as.BibEntry(bib)



