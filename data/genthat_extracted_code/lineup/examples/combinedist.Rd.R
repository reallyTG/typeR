library(lineup)


### Name: combinedist
### Title: Combine distance matrices into a single such
### Aliases: combinedist
### Keywords: utilities

### ** Examples

library(qtl)

# load example data
data(f2cross, expr1, expr2, pmap, genepos)
## Don't show: 
keep <- c(1:20, 197, 553, 573, 740, 794, 822, 1474, 1522,
          1591, 1645, 2080, 2643, 2984, 3089, 3672, 4010, 4039,
          4159, 4191, 4198, 4213, 4401, 4544, 4593, 4925)
expr1 <- expr1[,keep]
expr2 <- expr2[,keep]
genepos <- genepos[keep,]
## End(Don't show)

# calculate QTL genotype probabilities
f2cross <- calc.genoprob(f2cross, step=1)

# find nearest pseudomarkers
pmark <- find.gene.pseudomarker(f2cross, pmap, genepos)

# line up individuals
id1 <- findCommonID(f2cross, expr1)
id2 <- findCommonID(f2cross, expr2)

# calculate LOD score for local eQTL
locallod1 <- calc.locallod(f2cross[,id1$first], expr1[id1$second,], pmark)
locallod2 <- calc.locallod(f2cross[,id2$first], expr2[id2$second,], pmark)

# take those with LOD > 25
expr1s <- expr1[,locallod1>25,drop=FALSE]
expr2s <- expr2[,locallod2>25,drop=FALSE]

# calculate distance between individuals
#     (prop'n mismatches between obs and inferred eQTL geno)
d1 <- disteg(f2cross, expr1s, pmark)
d2 <- disteg(f2cross, expr2s, pmark)

# combine distances
d <- combinedist(d1, d2)

# summary of problem samples
summary(d)




