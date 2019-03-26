library(metafor)


### Name: to.long
### Title: Convert Data from Vector to Long Format
### Aliases: to.long
### Keywords: manip

### ** Examples

### convert data to long format
dat <- to.long(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
dat

### extra long format
dat <- to.long(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, vlong=TRUE)
dat

### convert data to long format
dat <- to.long(measure="IRR", x1i=x1i, x2i=x2i, t1i=t1i, t2i=t2i,
               data=dat.hart1999, var.names=c("id", "group", "events", "ptime"))
dat

### convert data to long format
dat <- to.long(measure="MD", m1i=m1i, sd1i=sd1i, n1i=n1i,
               m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat.normand1999,
               var.names=c("id", "group", "mean", "sd", "n"))
dat



