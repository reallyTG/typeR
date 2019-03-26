library(BIOM.utils)


### Name: BIOM Dimensions
### Title: Row and column information of BIOM data
### Aliases: dim.biom dimnames.biom metadata metadata.biom

### ** Examples

##  one toy example, one real example:
dd <- biom (dmat, quiet=TRUE)
ff <- biom (li4, quiet=TRUE)

dim (dd)
dim (ff)
dim (as.matrix (ff))
dim (as.matrix (ff, expand=TRUE))

dimnames (dd)
dimnames (ff)

##  automatic row and column ids:
dimnames (biom (smat, sparse=TRUE, quiet=TRUE))

##  no metadata:
print (metadata (dd))

##  simple metadata:
ss <- biom (li3)
print (as.matrix (ss))
metadata (ss) $ columns

##  complicated metadata, so look only at part:
head (metadata(ff) $ rows)
str (metadata(ff) $ columns [[1]])



