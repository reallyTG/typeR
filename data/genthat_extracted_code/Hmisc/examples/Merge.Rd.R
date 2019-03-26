library(Hmisc)


### Name: Merge
### Title: Merge Multiple Data Frames or Data Tables
### Aliases: Merge

### ** Examples

a <- data.frame(sid=1:3, age=c(20,30,40))
b <- data.frame(sid=c(1,2,2), bp=c(120,130,140))
d <- data.frame(sid=c(1,3,4), wt=c(170,180,190))
all <- Merge(a, b, d, id = ~ sid)
all
## Not run: 
##D # For data.table, first file must be the master file and must
##D # contain all ids that ever occur.  ids not in the master will
##D # not be merged from other datasets.
##D require(data.table)
##D a <- data.table(a); setkey(a, sid)
##D # data.table also does not allow duplicates without allow.cartesian=TRUE
##D b <- data.table(sid=1:2, bp=c(120,130)); setkey(b, sid)
##D d <- data.table(d); setkey(d, sid)
##D all <- Merge(a, b, d)
##D all
## End(Not run)



