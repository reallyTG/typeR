library(matR)


### Name: BIOMrename
### Title: Change row and column identifiers of BIOM data
### Aliases: dimnames<-.biom

### ** Examples

####  even if not particularly useful, this is allowed
yy <- xx4
dimnames (yy) <- list (letters [1:nrow(yy)], LETTERS [1:ncol(yy)])

####  more useful: renaming columns by codes taken from metadata
colnames (yy) <- columns (yy, "sample.data.sample_name")



