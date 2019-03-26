library(RefManageR)


### Name: as.data.frame.BibEntry
### Title: Coerce to a Data Frame
### Aliases: as.data.frame.BibEntry

### ** Examples

bib <- list(c(bibtype = "article", key = "mclean2014a", title = "My New Article", 
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-01"), 
  c(bibtype = "article", key = "mclean2014b", volume = 10, title = "My Newer Article", 
  author = "Mathew W. McLean", journaltitle = "The Journal", date = "2014-02"))       
bib <- as.BibEntry(bib)   
as.data.frame(bib)



