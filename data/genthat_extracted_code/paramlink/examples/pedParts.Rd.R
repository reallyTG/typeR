library(paramlink)


### Name: pedParts
### Title: Pedigree subsets
### Aliases: pedParts offspring spouses related.pairs unrelated leaves
###   parents grandparents siblings cousins nephews_nieces ancestors
###   descendants

### ** Examples


p = cbind(ID=2:9, FID=c(0,0,2,0,4,4,0,2), MID=c(0,0,3,0,5,5,0,8), 
        SEX=c(1,2,1,2,1,2,2,2), AFF=c(2,1,2,1,2,1,1,2))
x = linkdat(p)
stopifnot(setequal(spouses(x, 2), c(3,8)), 
          setequal(offspring(x, 2), c(4,9)), 
          setequal(descendants(x, 2), c(4,6,7,9)), 
          setequal(leaves(x), c(6,7,9)))

# Creating a loop and detecting it with 'pedigreeLoops' 
# (note that we get two loops, one for each inbred child):
loopx = addOffspring(x, father=4, mother=9, noffs=2)
lps = pedigreeLoops(loopx)
stopifnot(lps[[1]]$top == 2, setequal(sapply(lps, '[[', 'bottom'), 10:11))

# We add genotypes for a single SNP marker and compute a LOD score under a dominant model.
loopx = setMarkers(loopx, cbind(1,c(2,1,2,1,2,1,1,2,1,1)))
loopx = setModel(loopx, 1)

# Loops are automatically broken in lod():
LOD1 = lod(loopx, theta=0.1)
stopifnot(round(LOD1, 3) == 1.746)

# Or we can break the loop manually before computing the LOD:
loopfree = breakLoops(loopx, loop_breaker=4)
LOD2 = lod(loopfree, theta=0.1)
stopifnot(all.equal(loopx, tieLoops(loopfree)))
stopifnot(all.equal(LOD1, LOD2))




