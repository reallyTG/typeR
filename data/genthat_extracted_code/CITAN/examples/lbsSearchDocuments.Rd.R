library(CITAN)


### Name: lbsSearchDocuments
### Title: Find documents that satisfy given criteria
### Aliases: lbsSearchDocuments

### ** Examples

## Not run: 
##D conn <- dbBiblioConnect("Bibliometrics.db");
##D ## ...
##D idd <- lbsSearchDocuments(conn, pages.expr=">= 400",
##D    year.expr="BETWEEN 1970 AND 1972");
##D lbsGetInfoDocuments(conn, idd);
##D ## ...
## End(Not run)



