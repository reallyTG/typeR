library(ff)


### Name: ffdf
### Title: ff class for data.frames
### Aliases: ffdf
### Keywords: IO data

### ** Examples

 m <- matrix(1:12, 3, 4, dimnames=list(c("r1","r2","r3"), c("m1","m2","m3","m4")))
 v <- 1:3
 ffm <- as.ff(m)
 ffv <- as.ff(v)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm), ff_split=1)
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm), ff_join=list(newff=c(1,2)))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(I(m), I(v))
 ffd <- ffdf(m=I(ffm), v=I(ffv), row.names=row.names(ffm))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 rm(ffm,ffv,ffd); gc()



