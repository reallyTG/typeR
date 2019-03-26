library(orddom)


### Name: dms
### Title: Dominance Matrix in Symbols
### Aliases: dms
### Keywords: array

### ** Examples
## Not run: 
##D > x<-t(matrix(c(1,1,2,2,2,3,3,3,4,5),1))
##D > y<-t(matrix(c(1,2,3,4,4,5),1))
##D > write.table(dms(dm(x,y)),quote=FALSE,row.names=FALSE,col.names=FALSE,sep="")
##D O-----
##D O-----
##D +O----
##D +O----
##D +O----
##D ++O---
##D ++O---
##D ++O---
##D +++OO-
##D +++++O
## End(Not run)


