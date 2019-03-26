library(RecordLinkage)


### Name: RLBigDataDedup
### Title: Constructors for big data objects.
### Aliases: RLBigDataDedup RLBigDataLinkage
### Keywords: classif

### ** Examples

data(RLdata500)
data(RLdata10000)
# deduplication without blocking, use string comparator on names
rpairs <- RLBigDataDedup(RLdata500, strcmp = 1:4)
# linkage with blocking on first name and year of birth, use phonetic
# code on first components of first and last name
rpairs <- RLBigDataLinkage(RLdata500, RLdata10000, blockfld = c(1, 7),
  phonetic = c(1, 3))
# deduplication with blocking on either last name or complete date of birth,
# use string comparator on all fields, include identity information
rpairs <- RLBigDataDedup(RLdata500, identity = identity.RLdata500, strcmp=TRUE,
  blockfld = list(1, c(5, 6, 7)))




