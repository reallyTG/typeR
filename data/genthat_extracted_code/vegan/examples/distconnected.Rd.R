library(vegan)


### Name: distconnected
### Title: Connectedness of Dissimilarities
### Aliases: distconnected no.shared
### Keywords: multivariate

### ** Examples

## There are no disconnected data in vegan, and the following uses an
## extremely low threshold limit for connectedness. This is for
## illustration only, and not a recommended practice.
data(dune)
dis <- vegdist(dune)
gr <- distconnected(dis, toolong=0.4)
# Make sites with no shared species as NA in Manhattan dissimilarities
dis <- vegdist(dune, "manhattan")
is.na(dis) <- no.shared(dune)



