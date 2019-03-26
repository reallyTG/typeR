library(rotl)


### Name: strip_ott_ids
### Title: Strip OTT ids from tip labels
### Aliases: strip_ott_ids

### ** Examples

## Not run: 
##D genera <- c("Perdix", "Setophaga", "Cinclus", "Struthio")
##D tr <- tol_induced_subtree(ott_ids=c(102710, 285198, 267845, 292466))
##D tr$tip.label %in% genera
##D tr$tip.label <- strip_ott_ids(tr$tip.label)
##D tr$tip.label %in% genera
## End(Not run)



