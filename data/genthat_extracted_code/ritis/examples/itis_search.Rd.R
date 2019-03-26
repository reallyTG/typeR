library(ritis)


### Name: itis_search
### Title: ITIS Solr search
### Aliases: itis_search

### ** Examples

## Not run: 
##D itis_search(q = "tsn:182662")
##D 
##D itis_search(q = "nameWOInd:Liquidamber\\%20styraciflua~0.4")
##D # matches only monomials
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/")
##D # matches only binomials
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
##D # matches only trinomials
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
##D # matches binomials or trinomials
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*[%20]{0,1}[A-Za-z0-9]*/")
##D 
##D itis_search(q = "nameWOInd:Poa\\%20annua")
##D 
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/", rows = 2)
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/", rows = 200)
##D 
##D itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/",
##D    fl = c('nameWInd', 'tsn'))
## End(Not run)



