library(qdap)


### Name: cm_combine.dummy
### Title: Find Co-occurrence Between Dummy Codes
### Aliases: cm_combine.dummy
### Keywords: co-occurrence

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
##D 
##D (x <- cm_range2long(foo))
##D (D1 <- cm_long2dummy(x))
##D 
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D (D2 <- cm_long2dummy(z, "time"))
##D cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)))
##D cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap="==1")
##D cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap="!=1")
##D D1 <- cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap=0)
##D D1 <- cm_combine.dummy(D1, combine.code = list(CAB=qcv(AB, CC)), overlap=FALSE)
##D 
##D combines <- list(AB=qcv(AA, BB), ABC=qcv(AA, BB, CC))
##D cm_combine.dummy(D1, combine.code = combines)
##D cm_combine.dummy(D2, combine.code = combines)
## End(Not run)



