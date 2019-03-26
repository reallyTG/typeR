library(qdap)


### Name: cm_time.temp
### Title: Time Span Code Sheet
### Aliases: cm_time.temp
### Keywords: coding

### ** Examples

## Not run: 
##D ## cm_time.temp(qcv(AA, BB, CC), ":30", "7:40", file = "foo.txt")
##D ## library(reports); delete("foo.txt")
##D cm_time.temp(qcv(AA, BB, CC), ":30", "7:40")
##D 
##D x <- list(
##D     transcript_time_span = qcv(terms="00:00 - 1:12:00"),
##D     A = qcv(terms="2.40:3.00, 5.01, 6.52:7.00, 9.00"),
##D     B = qcv(terms="2.40, 3.01:3.02, 5.01, 6.52:7.00, 9.00, 1.12.00:1.19.01"),
##D     C = qcv(terms="2.40:3.00, 5.01, 6.52:7.00, 9.00, 17.01")
##D )
##D cm_time2long(x)
##D cm_time.temp(qcv(AA, BB, CC))
## End(Not run)



