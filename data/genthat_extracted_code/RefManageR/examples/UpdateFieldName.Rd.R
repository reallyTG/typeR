library(RefManageR)


### Name: UpdateFieldName
### Title: Rename a field in a BibEntry object.
### Aliases: UpdateFieldName
### Keywords: manip utilities

### ** Examples

bib <- as.BibEntry(list(c(bibtype = "article", key = "mclean2014a", title = "My New Article", 
  author = "Mathew W. McLean", journal = "The Journal", date = "2014-01"), 
  c(bibtype = "article", key = "mclean2014b", title = "My Newer Article", 
    author = "Mathew W. McLean", journal = "The Journal", date = "2014-02")))       
bib <- UpdateFieldName(bib, "journal", "journaltitle")
toBiblatex(bib)   



