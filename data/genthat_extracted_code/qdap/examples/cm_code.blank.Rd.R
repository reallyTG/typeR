library(qdap)


### Name: cm_code.blank
### Title: Blank Code Transformation
### Aliases: cm_code.blank
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
##D ## Single occurrence version
##D (x <- cm_range2long(foo))
##D 
##D cm_code.blank(x, combine.code.list = list(ABC=qcv(AA, BB, CC)),
##D     overlap = "!=1")
##D 
##D ## Repeated measures version
##D (z <- cm_range2long(foo, foo2, v.name="time"))
##D 
##D cm_code.blank(z, combine.code.list = list(ABC=qcv(AA, BB, CC)),
##D     rm.var = "time", overlap = "!=1")
##D 
##D cm_code.blank(z, combine.code.list = list(AB=qcv(AA, BB)),
##D     rm.var = "time", overlap = TRUE)
##D 
##D cm_code.blank(z, combine.code.list = list(AB=qcv(AA, BB)),
##D     rm.var = "time", overlap = FALSE)
##D 
##D cm_code.blank(z, combine.code.list = list(AB=qcv(AA, BB)),
##D     rm.var = "time", overlap = ">1")
##D 
##D cm_code.blank(z, combine.code.list = list(AB=qcv(AA, BB)),
##D     rm.var = "time", overlap = "==2")
##D 
##D ## Notice `overlap = "==2"` above is identical to `cm_code.overlap`
##D cm_code.overlap(z, overlap.code.list = list(AB=qcv(AA, BB)),
##D     rm.var = "time")
##D 
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
##D dat <- cm_time2long(x, y, v.name="time")
##D head(dat, 10)
##D out <- cm_code.blank(dat, combine.code.list = list(ABC=qcv(A, B, C)),
##D     rm.var = "time", overlap = "!=1")
##D 
##D head(out)
##D plot(out)
## End(Not run)



