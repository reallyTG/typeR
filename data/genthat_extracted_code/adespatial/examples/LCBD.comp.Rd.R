library(adespatial)


### Name: LCBD.comp
### Title: Compute LCBD from any D matrix
### Aliases: LCBD.comp
### Keywords: spatial

### ** Examples


### Example 1
### Compute the Hellinger distance, then the LCBD indices.
if(require("vegan", quietly = TRUE)){
data(mite)
mite.hel = decostand(mite, "hellinger")
mite.D = dist(mite.hel)
out.mite.D = LCBD.comp(mite.D, sqrt.D=FALSE)
}

### Example 2
if(require("ade4", quietly = TRUE) & require("adegraphics", quietly = TRUE)){
data(doubs)
fish.sp = doubs$fish[-8,]   # Fish data; site 8 is removed because no fish were caught

out.comp = beta.div.comp(fish.sp, coef="S", quant=TRUE)

out.fish.D = LCBD.comp(out.comp$D, sqrt.D=TRUE)   # out.comp.D is not Euclidean
out.fish.D$beta
out.fish.Repl = LCBD.comp(out.comp$repl, sqrt.D=TRUE)   # out.comp$repl is not Euclidean
out.fish.Repl$beta
out.fish.AbDiff = LCBD.comp(out.comp$rich, sqrt.D=FALSE)   # out.comp$rich is Euclidean
out.fish.AbDiff$beta

### Plot maps of the LCBD indices
fish.xy = doubs$xy[-8,]   # Geographic coordinates; site 8 removed because no fish were caught

# Map of LCBD indices for %difference dissimilarity
s.value(fish.xy, out.fish.D$LCBD, method="size", symbol = "circle",
col = c("white", "brown"), main = "Doubs fish LCBD, %difference D")

# Map of LCBD indices for replacement component of %difference dissimilarity
s.value(fish.xy, out.fish.Repl$LCBD, method="size", symbol = "circle",
col = c("white", "brown"), main = "Doubs fish replacement LCBD")

# Map of LCBD indices for abundance difference component of %difference dissimilarity
s.value(fish.xy, out.fish.AbDiff$LCBD, method="size", symbol = "circle", 
col = c("white", "brown"), main = "Doubs fish abundance diff. LCBD")
}

## Not run: 
##D ### Example 3
##D ### This example requires packages \code{"betapart"} and \code{"ade4"} for data. 
##D ### For the Baselga-family indices, the same partitioning results are obtained using
##D ### (1) beta.div.comp or (2) beta.pair.abund() of \code{"betapart"} and LCBD.comp()
##D 
##D data(doubs)   # Data available in \code{"ade4"}
##D fish.sp = doubs$fish[-8,]   
##D # Fish data; site 8 is removed because no fish were caught
##D # We use abundance data in this example, not presence-absence data
##D 
##D # Partition into Baselga-family replacement and nestedness components 
##D # using \code{"beta.div.comp"} with the percentage difference index (aka Bray-Curtis)
##D out.comp = beta.div.comp(fish.sp, coef="BS", quant=TRUE)
##D out.comp$part
##D 
##D # Compute the D and component matrices using \code{"beta.pair.abund"}
##D out3 = beta.pair.abund(fish.sp, index.family = "bray")
##D summary(out3)
##D 
##D is.euclid(out3$beta.bray)    # D matrix out3$beta.bray is not Euclidean
##D out3.D = LCBD.comp(out3$beta.bray, sqrt.D=TRUE)
##D out3.D$beta
##D # Compare BDtotal here to BDtotal in out.comp$part (above)
##D 
##D out3.Repl = LCBD.comp(out3$beta.bray.bal, sqrt.D=TRUE)
##D out3.Repl$beta
##D # Compare BDtotal here to RichDiff in out.comp$part (above)
##D 
##D out3.AbDiff = LCBD.comp(out3$beta.bray.gra, sqrt.D=TRUE)
##D out3.AbDiff$beta
##D # Compare BDtotal here to RichDiff/Nes in out.comp$part (above)
## End(Not run)




