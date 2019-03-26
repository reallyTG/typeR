library(qdap)


### Name: cm_code.transform
### Title: Transform Codes
### Aliases: cm_code.transform
### Keywords: transform

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
##D bar1 <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "0.00:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 9.00,
##D         1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 16.25:17.01")
##D )
##D 
##D (x <- cm_range2long(foo))
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D (dat <- cm_time2long(bar1))
##D 
##D cm_code.transform(x, 
##D     overlap.code.list = list(ABC=qcv(AA, BB, CC)),
##D     combine.code.list = list(oABC=qcv(AA, BB, CC)), 
##D     exclude.code.list = list(ABnoC=qcv(AA, BB, CC))
##D )
##D 
##D cm_code.transform(z, 
##D     overlap.code.list = list(ABC=qcv(AA, BB, CC)),
##D     combine.code.list = list(oABC=qcv(AA, BB, CC)), 
##D     exclude.code.list = list(ABnoC=qcv(AA, BB, CC)), "time"
##D )
##D 
##D cm_code.transform(dat, 
##D     overlap.code.list = list(ABC=qcv(A, B, C)),
##D     combine.code.list = list(oABC=qcv(A, B, C)), 
##D     exclude.code.list = list(ABnoC=qcv(A, B, C))
##D )
## End(Not run)



