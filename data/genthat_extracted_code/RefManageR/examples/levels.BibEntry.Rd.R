library(RefManageR)


### Name: levels.BibEntry
### Title: Extract all fields present in a BibEntry object
### Aliases: levels.BibEntry fields fields
### Keywords: methods

### ** Examples

bib <- as.BibEntry(list(c(bibtype = "Article", key = "mclean2014a", title = "My New Article", 
  author = "Mathew W. McLean", 
  journaltitle = "The Journal", date = "2014-01"), c(bibtype = "Book", key = "mclean2014b", 
  title = "My New Book", editor = "Mathew W. McLean", ISBN = "247123837", date = "2014-02")))       
fields(bib)
levels(bib)



