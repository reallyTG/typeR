library(wikisourcer)


### Name: wikisource_book
### Title: Download a book from Wikisource
### Aliases: wikisource_book

### ** Examples


## Not run: 
##D 
##D # download Voltaire's "Candide"
##D wikisource_book("https://en.wikisource.org/wiki/Candide")
##D 
##D # download "Candide" in French and Spanish
##D library(purrr)
##D 
##D fr <- "https://fr.wikisource.org/wiki/Candide,_ou_l%E2%80%99Optimisme/Garnier_1877"
##D de <- "https://es.wikisource.org/wiki/C%C3%A1ndido,_o_el_optimismo"
##D books <- map_df(c(fr, es), wikisource_book)
## End(Not run)




