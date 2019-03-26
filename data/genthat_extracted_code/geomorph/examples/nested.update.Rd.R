library(geomorph)


### Name: nested.update
### Title: Update procD.lm objects with nested effects
### Aliases: nested.update
### Keywords: utilities

### ** Examples


data(larvalMorph)
Y.gpa <- gpagen(larvalMorph$tailcoords)
gdf <- geomorph.data.frame(Y.gpa, Treatment = larvalMorph$treatment, Family = larvalMorph$family)

# Model with fixed and nested effects
tailANOVA <- procD.lm(coords ~ Treatment/Family, iter = 99, RRPP=TRUE, data=gdf)
summary(tailANOVA)

# Update for nested effects
tailANOVA <- nested.update(tailANOVA, ~ Treatment/Family)
summary(tailANOVA)

# Model with random, fixed, and nested effects
tailANOVA <- procD.lm(coords ~ Family + Treatment/Family, iter=99, RRPP=TRUE, data=gdf)
summary(tailANOVA)

# Update for nested effects
tailANOVA <- nested.update(tailANOVA, ~ Family + Treatment/Family)
summary(tailANOVA)

# One needs to be careful using this function!

tailANOVA <- procD.lm(coords ~ Csize * Treatment/Family, iter=99, RRPP=TRUE, data=gdf)

# This will not work: tailANOVA <- nested.update(tailANOVA, ~ Treatment/Family) 
# The updated terms must be included as part of the original terms

tailANOVA <- procD.lm(coords ~ Csize + Treatment/Family, iter=99, RRPP=TRUE, data=gdf)
summary(tailANOVA)

# Now the format will allow an update

tailANOVA <- nested.update(tailANOVA, ~ Treatment/Family) 

summary(tailANOVA)



