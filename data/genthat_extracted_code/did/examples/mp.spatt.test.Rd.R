library(did)


### Name: mp.spatt.test
### Title: mp.spatt.test
### Aliases: mp.spatt.test

### ** Examples

## Not run: 
##D data(mpdta)
##D mptest <- mp.spatt.test(lemp ~ treat, xformlalist=list(~lpop), data=mpdta,
##D                 panel=TRUE, first.treat.name="first.treat",
##D                 idname="countyreal", tname="year", clustervarlist=list(NULL))
##D summary(mptest[[1]])
## End(Not run)

data(mpdta)
mptest <- mp.spatt.test(lemp ~ treat, xformlalist=list(NULL), data=mpdta,
                panel=TRUE, first.treat.name="first.treat",
                idname="countyreal", tname="year", clustervarlist=list(NULL))
summary(mptest[[1]])




