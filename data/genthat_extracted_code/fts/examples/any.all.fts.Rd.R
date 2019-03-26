library(fts)


### Name: fts.logical
### Title: Logical subsets of objects
### Aliases: fts.logical col.any col.all row.any row.all
### Keywords: ts

### ** Examples

x <- fts(seq(from=Sys.Date(),by="months",length.out=50),matrix(rnorm(100),nrow=50))
jj <- x > 0
row.all(jj)
row.any(jj)

col.any(x > 0)
col.all(x > -3)



