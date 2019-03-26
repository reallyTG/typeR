library(CITAN)


### Name: lbsDeleteDocuments
### Title: Delete given documents
### Aliases: lbsDeleteDocuments

### ** Examples

## Not run: 
##D conn <- lbsConnect("Bibliometrics.db");
##D ## ...
##D listdoc <- lbsFindDuplicateTitles(conn,
##D    ignoreTitles.like=c("In this issue%", "%Editorial", "%Introduction",
##D    "%In this issue", "Letter to %", "%Preface"),
##D    aggressiveness=2);
##D lbsDeleteDocuments(conn, listdoc);
##D dbCommit(conn);
##D ## ...
## End(Not run)



