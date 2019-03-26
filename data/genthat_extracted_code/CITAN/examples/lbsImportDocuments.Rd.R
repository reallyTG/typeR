library(CITAN)


### Name: lbsImportDocuments
### Title: Import bibliographic data into a Local Bibliometric Storage.
### Aliases: lbsImportDocuments

### ** Examples

## Not run: 
##D conn <- lbsConnect("Bibliometrics.db");
##D ## ...
##D data <- Scopus_ReadCSV("db_Polish_MATH/Poland_MATH_1987-1993.csv");
##D lbsImportDocuments(conn, data, "Poland_MATH");
##D ## ...
##D lbsDisconnect(conn);
## End(Not run)



