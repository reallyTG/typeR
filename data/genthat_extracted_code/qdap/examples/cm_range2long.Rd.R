library(qdap)


### Name: cm_range2long
### Title: Transform Codes to Start-End Durations
### Aliases: cm_range2long
### Keywords: coding, span time

### ** Examples

## Not run: 
##D foo <- list(
##D     person_greg = qcv(terms='7:11, 20:24, 30:33, 49:56'),
##D     person_researcher = qcv(terms='42:48'),
##D     person_sally = qcv(terms='25:29, 37:41'),
##D     person_sam = qcv(terms='1:6, 16:19, 34:36'),
##D     person_teacher = qcv(terms='12:15'),
##D     adult_0 = qcv(terms='1:11, 16:41, 49:56'),
##D     adult_1 = qcv(terms='12:15, 42:48'),
##D     AA = qcv(terms="1"),
##D     BB = qcv(terms="1:2, 3:10, 19"),
##D     CC = qcv(terms="1:9, 100:150")
##D )
##D 
##D foo2  <- list(
##D     person_greg = qcv(terms='7:11, 20:24, 30:33, 49:56'),
##D     person_researcher = qcv(terms='42:48'),
##D     person_sally = qcv(terms='25:29, 37:41'),
##D     person_sam = qcv(terms='1:6, 16:19, 34:36'),
##D     person_teacher = qcv(terms='12:15'),
##D     adult_0 = qcv(terms='1:11, 16:41, 49:56'),
##D     adult_1 = qcv(terms='12:15, 42:48'),
##D     AA = qcv(terms="40"),
##D     BB = qcv(terms="50:90"),
##D     CC = qcv(terms="60:90, 100:120, 150"),
##D     DD = qcv(terms="")
##D )
##D 
##D ## General ldots Approach
##D (dat <- cm_range2long(foo, foo2, v.name = "time"))
##D plot(dat)
##D 
##D ## Specify `object` Approach
##D cm_range2long(object=list(foo=foo))
##D cm_range2long(object=list(foo=foo, foo2=foo2), v.name="time")
##D cm_range2long(object=list(a=foo, b=foo2), v.name="time")
## End(Not run)



