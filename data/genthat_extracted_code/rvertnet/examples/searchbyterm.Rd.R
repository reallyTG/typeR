library(rvertnet)


### Name: searchbyterm
### Title: Search by term
### Aliases: searchbyterm

### ** Examples

## Not run: 
##D # Find multiple species
##D out <- searchbyterm(genus = "ochotona",
##D   specificepithet = "(princeps OR collaris)", limit=10)
##D 
##D # Specifying a range (in meters) for uncertainty in spatial location
##D # (use quotes)
##D out <- searchbyterm(class = "aves", state = "nevada", error = "<25")
##D out <- searchbyterm(class = "aves", state = "california", year = 1976,
##D   error = "<=1000")
##D 
##D # Specifying records by event date (use quotes)
##D out <- searchbyterm(class = "aves", state = "california",
##D   date = "2009-03-25")
##D # ...but specifying a date range may not work
##D out <- searchbyterm(specificepithet = "nigripes",
##D   date = "1935-09-01/1935-09-30")
##D 
##D # Pass in curl options for curl debugging
##D out <- searchbyterm(class = "aves", limit = 10, 
##D  callopts = list(verbose = TRUE))
##D 
##D # Use more than one year query
##D searchbyterm(cgenus = "mustela", specificepithet = "nigripes", 
##D    year = c('>=1900', '<=1940'))
##D 
##D # full text search - note the URL message
##D searchbyterm(query = "Mustela nigripes", limit = 50)
##D searchbyterm(query = "bear", limit = 50)
## End(Not run)



