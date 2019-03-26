library(qdap)


### Name: cm_code.combine
### Title: Combine Codes
### Aliases: cm_code.combine
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
##D (x <- cm_range2long(foo))
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D cm_code.combine(x, list(AB=qcv(AA, BB)))
##D cm_code.combine(x, list(ALL=qcv(AA, BB, CC)))
##D combines <- list(AB=qcv(AA, BB), ABC=qcv(AA, BB, CC))
##D cm_code.combine(z, combines, rm.var = "time")
##D 
##D #WITH cm_time2long
##D x <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 9.00, 
##D         1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 17.01")
##D )
##D 
##D y <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 9.00, 
##D         1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 17.01")
##D )
##D 
##D dat <- cm_time2long(x, y)
##D head(dat, 12)
##D cm_code.combine(dat, list(P=qcv(A, B), Q=qcv(B, C), R=qcv(A, B, C)), "variable")
## End(Not run)



