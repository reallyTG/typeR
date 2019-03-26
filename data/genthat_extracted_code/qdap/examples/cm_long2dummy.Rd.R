library(qdap)


### Name: cm_long2dummy
### Title: Stretch and Dummy Code cm_xxx2long
### Aliases: cm_long2dummy
### Keywords: coded dummy

### ** Examples

## Not run: 
##D foo <- list(
##D     AA = qcv(terms="1:10"),
##D     BB = qcv(terms="1:2, 3:10, 19"),
##D     CC = qcv(terms="1:3, 5:6")
##D )
##D 
##D foo2  <- list(
##D     AA = qcv(terms="4:8"),
##D     BB = qcv(terms="1:4, 10:12"),
##D     CC = qcv(terms="1, 11, 15:20"),
##D     DD = qcv(terms="")
##D )
##D 
##D (x <- cm_range2long(foo))
##D cm_long2dummy(x)
##D 
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D out <- cm_long2dummy(z, "time")
##D ltruncdf(out)
## End(Not run)



