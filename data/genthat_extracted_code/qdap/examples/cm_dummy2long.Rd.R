library(qdap)


### Name: cm_dummy2long
### Title: Convert cm_combine.dummy Back to Long
### Aliases: cm_dummy2long

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
##D (out1 <- cm_long2dummy(x))
##D 
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D out2 <- cm_long2dummy(z, "time")
##D lapply(out2, head)
##D cm_combine.dummy(out1, combine.code = list(AB=qcv(AA, BB)))
##D 
##D combines <- list(AB=qcv(AA, BB), ABC=qcv(AA, BB, CC))
##D A <- cm_combine.dummy(out2, combine.code = combines)
##D head(A, 10)
##D B <- cm_combine.dummy(out1, combine.code = combines)
##D head(B, 10)
##D 
##D cm_dummy2long(A)
##D cm_dummy2long(B)
##D plot(cm_dummy2long(A))
## End(Not run)



