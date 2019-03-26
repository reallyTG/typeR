library(qdap)


### Name: cm_2long
### Title: A Generic to Long Function
### Aliases: cm_2long
### Keywords: long

### ** Examples

## Not run: 
##D ## cm_range2long use: 
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
##D cm_2long(foo, foo2, v.name = "time")
##D 
##D ## cm_time2long use: 
##D x <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00"),
##D     B = qcv(terms = "2.40, 3.01:3.02, 5.01, 6.02:7.00, 
##D         9.00, 1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.02:7.00, 9.00, 17.01")
##D )
##D cm_2long(x)
##D 
##D ## cm_df2long use:
##D codes <- qcv(dc, sf, wes, pol, rejk, lk, azx, mmm)
##D x1 <- cm_df.temp(DATA, "state", codes)
##D #fill it randomly
##D x1[, 7:14] <- lapply(7:14,  function(i) sample(0:1, nrow(x1), TRUE))
##D out2 <- cm_2long(x1)
##D head(out2, 15)
##D plot(out2)
## End(Not run)



