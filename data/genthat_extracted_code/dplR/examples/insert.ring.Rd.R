library(dplR)


### Name: insert.ring
### Title: Edit a Ring-Width Series
### Aliases: insert.ring delete.ring
### Keywords: manip

### ** Examples
library(utils)
data(gp.rwl)
series <- gp.rwl$"50A"
names(series) <- rownames(gp.rwl)
series <- series[!is.na(series)]
series
insert.ring(rw.vec=series,year=1950,ring.value=0)
insert.ring(rw.vec=series,year=1950,ring.value=0,fix.last=FALSE)
delete.ring(rw.vec=series,year=1900)
delete.ring(rw.vec=series,year=1900,fix.last=FALSE)



