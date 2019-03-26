library(RecordLinkage)


### Name: compare
### Title: Compare Records
### Aliases: compare.dedup compare.linkage
### Keywords: classif

### ** Examples

data(RLdata500)
data(RLdata10000)

# deduplication without blocking, use string comparator on names
## Not run: rpairs=compare.dedup(RLdata500,strcmp=1:4)
# linkage with blocking on first name and year of birth, use phonetic
# code on first components of first and last name
rpairs=compare.linkage(RLdata500,RLdata10000,blockfld=c(1,7),phonetic=c(1,3))
# deduplication with blocking on either last name or complete date of birth,
# use string comparator on all fields, include identity information
rpairs=compare.dedup(RLdata500, identity=identity.RLdata500, strcmp=TRUE,
  blockfld=list(1,c(5,6,7)))
# Draw 100 matches and 1000 non-matches
## Not run: 
##D rpairs=compare.dedup(RLdata10000,identity=identity.RLdata10000,n_match=100,
##D   n_non_match=10000)
## End(Not run)



