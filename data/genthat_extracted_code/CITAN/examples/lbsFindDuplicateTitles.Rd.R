library(CITAN)


### Name: lbsFindDuplicateTitles
### Title: Find documents to be merged (**EXPERIMENTAL**)
### Aliases: lbsFindDuplicateTitles

### ** Examples

## Not run: 
##D conn <- lbsConnect("Bibliometrics.db");
##D ## ...
##D listdoc <- lbsFindDuplicateTitles(conn,
##D    ignoreTitles.like=c("%In this issue%", "%Editorial", "%Introduction",
##D    "Letter to %", "%Preface"),
##D    aggressiveness=2);
##D lbsDeleteDocuments(conn, listdoc);
##D dbCommit(conn);
##D ## ...
## End(Not run)




