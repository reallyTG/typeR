library(dslice)


### Name: ds_gsa
### Title: Gene set analysis via dynamic slicing
### Aliases: ds_gsa

### ** Examples

##  Loading data from files
## Not run: 
##D gctpath <- "P53.gct"
##D clspath <- "P53.cls"
##D gmtpath <- "C2.gmt"
##D expdat <- load_gct(gctpath)
##D label <- load_cls(clspath)
##D geneset <- load_gmt(gmtpath)
##D fc <- function(x, label)
##D {
##D   d0 <- apply(x[,which(label == 0)], 1, mean)
##D   d1 <- apply(x[,which(label == 1)], 1, mean)
##D   d <- d1 / d0
##D   return(order(d))
##D }
##D ds_gsa_obj <- ds_gsa(expdat, geneset, label, "fc", lambda = 1.2, bycol = TRUE,
##D                      minsize = 15, maxsize = 500, randseed = 11235, rounds = 100)
## End(Not run)



