library(CITAN)


### Name: lbsSearchAuthors
### Title: Find authors that satisfy given criteria
### Aliases: lbsSearchAuthors

### ** Examples

## Not run: 
##D conn <- dbBiblioConnect("Bibliometrics.db");
##D ## ...
##D id <- lbsSearchAuthors(conn, c("Smith%", "Knuth D.E.", "V_n %"));
##D lbsGetInfoAuthors(conn, id);
##D ## ...
## End(Not run)



