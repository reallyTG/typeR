library(sitreeE)


### Name: PBAL.dbh.greater
### Title: Basal area of larger trees which are at least X cm larger than
###   the tree of interest
### Aliases: PBAL.dbh.greater

### ** Examples

PBAL.dbh.greater(c(100,89,51,74,4), 3)

aggregate(dbh ~ plot.id, data = tr, FUN = PBAL.dbh.greater, dbh.mm.diff = 2)




