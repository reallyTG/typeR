library(qdap)


### Name: cm_time2long
### Title: Transform Codes to Start-End Times
### Aliases: cm_time2long
### Keywords: coding, time-span

### ** Examples

## Not run: 
##D x <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 
##D         9.00, 1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 17.01")
##D )
##D (dat <- cm_time2long(x))
##D plot(dat)
##D 
##D bar1 <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 9.00,
##D         1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 16.25:17.01")
##D )
##D 
##D bar2 <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 9.00,
##D         1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 17.01")
##D )
##D 
##D ## General ldots Approach
##D cm_time2long(bar1)
##D cm_time2long(bar1, bar2, v.name="time")
##D 
##D ## Specify `object` Approach
##D cm_time2long(object=list(bar1=bar1))
##D cm_time2long(object=list(bar1=bar1, bar2=bar2), v.name="time")
##D cm_time2long(object=list(a=bar1, b=bar2), v.name="time")
## End(Not run)



