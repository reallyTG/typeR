library(aqp)


### Name: unique-methods
### Title: Get Indices to Unique Soil Profiles Within a Collection
### Aliases: unique uniqueSPC unique,SoilProfileCollection-method
### Keywords: methods manip

### ** Examples

## use the digest library to detect duplicate data
data(sp1)

# make a copy, make new IDs, and stack
s.1 <- sp1 
s.2 <- sp1
s.2$id <- paste(s.2$id, '-copy', sep='')
s <- rbind(s.1, s.2)
depths(s) <- id ~ top + bottom

# digests are computed from horizon-level data only
# horizon boundaries and 'prop'
# result is an index of unqique profiles

u <- unique(s, vars=c('top', 'bottom', 'prop'))

# compare with and without dupes:
# note subsetting of SoilProfileCollection
cbind(dupes=length(s), no.dupes=length(s[u, ]))



