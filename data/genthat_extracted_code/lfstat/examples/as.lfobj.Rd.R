library(lfstat)


### Name: as.lfobj
### Title: Coerce to class lfobj
### Aliases: as.lfobj as.lfobj.xts as.lfobj.zoo is.lfobj
### Keywords: methods manip

### ** Examples


data(ngaruroro)
is.lfobj(ngaruroro)

# coerce zoo object to class lfobj
z1 <- zoo(1:10, order.by = seq(Sys.Date(), length.out = 10, by = "days"))
as.lfobj(z1, hyearstart = 5)

# coerce xts object to class lfobj
xts1 <- xts(1:10, order.by = seq(Sys.Date(), length.out = 10, by = "days"))
as.lfobj(xts1, hyearstart = 5)






