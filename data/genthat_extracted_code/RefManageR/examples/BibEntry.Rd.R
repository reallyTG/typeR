library(RefManageR)


### Name: BibEntry
### Title: Enhanced Bibliographic Entries
### Aliases: BibEntry
### Keywords: database

### ** Examples

BibEntry(bibtype = "Article", key = "mclean2014", title = "An Article Title",
  author = " McLean, Mathew W. and Wand, Matt P.", journaltitle = "The Journal Title",
  date = "2014-02-06", pubstate = "forthcoming")
bib <- BibEntry(bibtype = "XData", key = "arxiv_data", eprinttype = "arxiv",
eprintclass = "stat.ME", year = 2013, urldate = "2014-02-01", pubstate = "submitted")
bib <- c(bib, BibEntry(bibtype = "Misc", key = "mclean2014b",
  title = "Something On the {arXiv}", author = "Mathew W. McLean", eprint = "1312.9999",
  xdata = "arxiv_data", url = "https://arxiv.org/abs/1310.5811"))
bib
toBiblatex(bib)



