library(qtl)


### Name: findDupMarkers
### Title: Find markers with identical genotype data
### Aliases: findDupMarkers
### Keywords: manip

### ** Examples

data(hyper)

hyper <- drop.nullmarkers(hyper)

dupmar <- findDupMarkers(hyper) # finds 4 pairs
dupmar.adjonly <- findDupMarkers(hyper, adjacent.only=TRUE) # finds 4 pairs

dupmar.nexact <- findDupMarkers(hyper, exact.only=FALSE, adjacent.only=TRUE) # finds 6 pairs

# one might consider dropping the extra markers
totmar(hyper) # 173 markers
hyper <- drop.markers(hyper, unlist(dupmar.adjonly))
totmar(hyper) # 169 markers



