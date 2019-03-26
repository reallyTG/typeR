library(koRpus)


### Name: read.BAWL
### Title: Import BAWL-R data
### Aliases: read.BAWL
### Keywords: corpora

### ** Examples

## Not run: 
##D bawl.corp <- read.BAWL("~/mydata/valence/BAWL-R.csv")
##D 
##D # you can now use query() now to create subsets of the word list,
##D # e.g., only nound with 5 letters and an valence rating of >= 1
##D bawl.stimulus <- query(bawl.corp,
##D   query=list(
##D     list(wclass="noun"),
##D     list(lttr=5),
##D     list("EMO_MEAN"=1, rel="ge")
##D   )
##D )
## End(Not run)



