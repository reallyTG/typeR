library(CITAN)


### Name: lbsFindDuplicateAuthors
### Title: Find groups of authors to be merged (**EXPERIMENTAL**)
### Aliases: lbsFindDuplicateAuthors

### ** Examples

## Not run: 
##D conn <- lbsConnect("Bibliometrics.db");
##D ## ...
##D listauth <- lbsFindDuplicateAuthors(conn,
##D    ignoreWords=c("van", "von", "der", "no", "author", "name", "available"),
##D    minWordLength=4,
##D    orderResultsBy=c("citations"),
##D    aggressiveness=1);
##D lbsMergeAuthors(conn, listauth);
##D dbCommit(conn);
##D ## ...
## End(Not run)



