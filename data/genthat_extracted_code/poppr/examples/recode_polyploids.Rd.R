library(poppr)


### Name: recode_polyploids
### Title: Recode polyploid microsatellite data for use in frequency based
###   statistics.
### Aliases: recode_polyploids

### ** Examples

data(Pinf)
iPinf <- recode_polyploids(Pinf)

# Note that the difference between the number of alleles.
nAll(Pinf)
nAll(iPinf)

## Not run: 
##D library("ape")
##D 
##D # Removing missing data. 
##D setPop(Pinf) <- ~Country
##D 
##D # Calculating Rogers' distance. 
##D rog <- rogers.dist(genind2genpop(Pinf))
##D irog <- rogers.dist(recode_polyploids(genind2genpop(Pinf)))
##D 
##D # We will now plot neighbor joining trees. Note the decreased distance in the
##D # original data.
##D plot(nj(rog), type = "unrooted")
##D add.scale.bar(lcol = "red", length = 0.02)
##D plot(nj(irog), type = "unrooted")
##D add.scale.bar(lcol = "red", length = 0.02)
## End(Not run)



