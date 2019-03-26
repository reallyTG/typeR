library(qdap)


### Name: colSplit
### Title: Separate a Column Pasted by paste2
### Aliases: colSplit
### Keywords: column-split

### ** Examples

## Not run: 
##D foo1 <- paste2(CO2[, 1:3])
##D head(foo1, 12)
##D bar1 <- colSplit(foo1)
##D head(bar1, 10)
##D 
##D foo2  <- paste2(mtcars[, 1:3], sep="|")
##D head(foo2, 12)
##D bar2 <- colSplit(foo2, col.sep = "|")
##D head(bar2, 10)
## End(Not run)



