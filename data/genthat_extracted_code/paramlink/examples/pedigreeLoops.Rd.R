library(paramlink)


### Name: pedigreeLoops
### Title: Pedigree loops
### Aliases: pedigreeLoops breakLoops tieLoops findLoopBreakers
###   findLoopBreakers2

### ** Examples


x = cousinsPed(1, child=TRUE)

# Make the child affected, and homozygous for rare allele.
x = swapAff(x, 9)
x = setMarkers(x, marker(x, 9, c(2,2), alleles=1:2, afreq=c(0.99, 0.01)))

# Compute the LOD score under a recessive model. Loops are automatically broken in lod().
x = setModel(x, 2)
LOD1 = lod(x, theta=0.1)
stopifnot(round(LOD1, 2) == 0.88)

# Or we can break the loop manually before computing the LOD:
loopfree = breakLoops(x, loop_breaker=8)
plot(loopfree)
LOD2 = lod(loopfree, theta=0.1)
stopifnot(all.equal(x, tieLoops(loopfree)))
stopifnot(all.equal(LOD1, LOD2))

# Pedigree with marriage loop: Double first cousins
if(require('igraph')) {
    y = doubleCousins(1, 1, child=TRUE)
    findLoopBreakers(y) # --> 9
    findLoopBreakers2(y) # --> 9 and 4
    breakLoops(y) # uses both 9 and 4
}




