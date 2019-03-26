library(greport)


### Name: Merge
### Title: Merge Multiple Data Frames or Data Tables
### Aliases: Merge

### ** Examples

a <- data.frame(sid=1:3, age=c(20,30,40))
b <- data.frame(sid=c(1,2,2), bp=c(120,130,140))
d <- data.frame(sid=c(1,3,4), wt=c(170,180,190))
all <- Merge(a, b, d, id = ~ sid)
# For data.table, first file must be the master file and must
# contain all ids that ever occur.  ids not in the master will
# not be merged from other datasets.
a <- data.table(a); setkey(a, sid)
# data.table also does not allow duplicates without allow.cartesian=TRUE
b <- data.table(sid=1:2, bp=c(120,130)); setkey(b, sid)
d <- data.table(d); setkey(d, sid)
all <- Merge(a, b, d)



