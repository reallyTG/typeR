library(rols)


### Name: OlsSearch-class
### Title: Class '"OlsSearch"'
### Aliases: OlsSearch class:OlsSearch OlsSearch-class olsSearch olsRows
###   olsRows<- allRows coerce,OlsSearch,data.frame-method
###   coerce,OlsSearch,Terms-method show,OlsSearch-method
### Keywords: classes

### ** Examples


OlsSearch(q = "trans-golgi")
OlsSearch(q = "cell")
OlsSearch(q = "cell", exact = TRUE)
OlsSearch(q = "cell", exact = TRUE, ontology = "go")
OlsSearch(q = "cell", exact = TRUE, ontology = "GO")

OlsSearch(q = "electrospray", ontology = "MS")
OlsSearch(q = "ionization", ontology = "MS")
OlsSearch(q = "electrospray ionization", ontology = "MS")
OlsSearch(q = "electrospray ionization", ontology = "MS", exact=TRUE)

## Request 5 results instead of 20 (default)
OlsSearch(q = "plasma,membrane", ontology = "go", rows = 5)

## or, once the object was created
(res <- OlsSearch(q = "plasma,membrane", ontology = "go"))
olsRows(res) <- 5
res
## all results
res <- allRows(res)
res

res <- OlsSearch(q = "trans-golgi", ontology = "go", rows = 5)
res
res <- olsSearch(res)
res
as(res, "data.frame")
res <- as(res, "Terms")
res
termPrefix(res)
termId(res)



