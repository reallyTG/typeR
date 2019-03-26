library(qdap)


### Name: cm_distance
### Title: Distance Matrix Between Codes
### Aliases: cm_distance
### Keywords: association codes distance

### ** Examples

## Not run: 
##D foo <- list(
##D     AA = qcv(terms="02:03, 05"),
##D     BB = qcv(terms="1:2, 3:10"),
##D     CC = qcv(terms="1:9, 100:150")
##D )
##D 
##D foo2  <- list(
##D     AA = qcv(terms="40"),
##D     BB = qcv(terms="50:90"),
##D     CC = qcv(terms="60:90, 100:120, 150"),
##D     DD = qcv(terms="")
##D )
##D 
##D (dat <- cm_2long(foo, foo2, v.name = "time"))
##D plot(dat)
##D (out <- cm_distance(dat, replications=100))
##D names(out)
##D names(out$main.output)
##D out$main.output
##D out$extended.output
##D print(out, new.order = c(3, 2, 1))
##D print(out, new.order = 3:2)
##D #========================================
##D x <- list(
##D     transcript_time_span = qcv(00:00 - 1:12:00),
##D     A = qcv(terms = "2.40:3.00, 6.32:7.00, 9.00,
##D         10.00:11.00, 59.56"),
##D     B = qcv(terms = "3.01:3.02, 5.01,  19.00, 1.12.00:1.19.01"),
##D     C = qcv(terms = "2.40:3.00, 5.01, 6.32:7.00, 9.00, 17.01")
##D )
##D (dat <- cm_2long(x))
##D plot(dat)
##D (a <- cm_distance(dat, causal=TRUE, replications=100))
##D 
##D ## Plotting as a network graph
##D datA <- list(
##D     A = qcv(terms="02:03, 05"),
##D     B = qcv(terms="1:2, 3:10, 45, 60, 200:206, 250, 289:299, 330"),
##D     C = qcv(terms="1:9, 47, 62, 100:150, 202, 260, 292:299, 332"),
##D     D = qcv(terms="10:20, 30, 38:44, 138:145"),
##D     E = qcv(terms="10:15, 32, 36:43, 132:140"),
##D     F = qcv(terms="1:2, 3:9, 10:15, 32, 36:43, 45, 60, 132:140, 250, 289:299"),
##D     G = qcv(terms="1:2, 3:9, 10:15, 32, 36:43, 45, 60, 132:140, 250, 289:299"),
##D     H = qcv(terms="20, 40, 60, 150, 190, 222, 255, 277"),
##D     I = qcv(terms="20, 40, 60, 150, 190, 222, 255, 277")
##D )
##D 
##D datB  <- list(
##D     A = qcv(terms="40"),
##D     B = qcv(terms="50:90, 110, 148, 177, 200:206, 250, 289:299"),
##D     C = qcv(terms="60:90, 100:120, 150, 201, 244, 292"),
##D     D = qcv(terms="10:20, 30, 38:44, 138:145"),
##D     E = qcv(terms="10:15, 32, 36:43, 132:140"),
##D     F = qcv(terms="10:15, 32, 36:43, 132:140, 148, 177, 200:206, 250, 289:299"),
##D     G = qcv(terms="10:15, 32, 36:43, 132:140, 148, 177, 200:206, 250, 289:299"),
##D     I = qcv(terms="20, 40, 60, 150, 190, 222, 255, 277")  
##D )
##D 
##D (datC <- cm_2long(datA, datB, v.name = "time"))
##D plot(datC)
##D (out2 <- cm_distance(datC, replications=1250))
##D 
##D plot(out2)
##D plot(out2, label.cex=2, label.dist=TRUE, digits=5)
## End(Not run)



