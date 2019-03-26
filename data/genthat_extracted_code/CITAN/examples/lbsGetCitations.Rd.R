library(CITAN)


### Name: lbsGetCitations
### Title: Fetch authors' citation sequences
### Aliases: lbsGetCitations

### ** Examples

## Not run: 
##D conn <- lbsConnect("Bibliometrics.db");
##D ## ...
##D citseq <- lbsGetCitations(conn,
##D 	surveyDescription="Scientometrics", documentTypes="Article",
##D 	idAuthors=c(39264,39265,39266));
##D print(citseq);
##D ## $`Liu X.`                                # Author name
##D ## 40116 34128 39122 29672 32343 32775      # IdDocument
##D ##    11     4     1     0     0     0      # Citation count
##D ## attr(,"IdAuthor")
##D ## [1] 39264                                # IdAuthor
##D ##
##D ## $`Xu Y.`
##D ## 38680 38605 40035 40030 40124 39829 39745 29672
##D ##    30    14     8     6     6     5     3     0
##D ## attr(,"IdAuthor")
##D ## [1] 39265
##D ##
##D ## $`Wang Y.`
##D ## 29992 29672 29777 32906 33858 33864 34704
##D ##     1     0     0     0     0     0     0
##D ## attr(,"IdAuthor")
##D ## [1] 39266
##D print(lbsAssess(citseq,
##D    f=list(length, sum, index.h, index.g, function(x) index.rp(x,1),
##D        function(x) sqrt(prod(index.lp(x,1))),
##D        function(x) sqrt(prod(index.lp(x,Inf)))),
##D    captions=c("length", "sum", "index.h", "index.g", "index.w",
##D    "index.lp1", "index.lpInf")));
##D ##      Name length sum index.h index.g index.w index.lp1 index.lpInf
##D ## 3   Xu Y.      8  72       5       8       7  8.573214    5.477226
##D ## 2 Wang Y.      7   1       1       1       1  1.000000    1.000000
##D ## 1  Liu X.      6  16       2       4       3  4.157609    3.316625
##D ## ...
##D dbDisconnect(conn);
## End(Not run)



