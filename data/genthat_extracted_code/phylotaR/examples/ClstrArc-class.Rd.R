library(phylotaR)


### Name: ClstrArc-class
### Title: Cluster record archive
### Aliases: ClstrArc-class ClstrArc-method as.character,ClstrArc-method
###   show,ClstrArc-method print,ClstrArc-method str,ClstrArc-method
###   summary,ClstrArc-method [[,ClstrArc,character-method
###   [,ClstrArc,character,missing,missing-method

### ** Examples

data('aotus')
clstrarc <- aotus@clstrs
# this is a ClstrArc object
# it contains cluster records
show(clstrarc)
# you can access its different data slots with @
clstrarc@ids     # unique cluster ID
clstrarc@clstrs  # list of cluster records
# access cluster records [[
(clstrarc[[clstrarc@ids[[1]]]])  # first cluster record
# generate new cluster archives with [
(clstrarc[clstrarc@ids[1:10]])  # first 10 clusters



