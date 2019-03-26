library(lineup)


### Name: disteg
### Title: Calculate distance between two gene expression data sets
### Aliases: disteg
### Keywords: utilities

### ** Examples

library(qtl)

# load example data
data(f2cross, expr1, pmap, genepos)
## Don't show: 
keep <- c(1:20, 197, 553, 573, 740, 794, 822, 1474, 1522,
          1591, 1645, 2080, 2643, 2984, 3089, 3672, 4010, 4039,
          4159, 4191, 4198, 4213, 4401, 4544, 4593, 4925)
expr1 <- expr1[,keep]
genepos <- genepos[keep,]
## End(Don't show)

# calculate QTL genotype probabilities
f2cross <- calc.genoprob(f2cross, step=1)

# find nearest pseudomarkers
pmark <- find.gene.pseudomarker(f2cross, pmap, genepos)

# line up individuals
id <- findCommonID(f2cross, expr1)

# calculate LOD score for local eQTL
locallod <- calc.locallod(f2cross[,id$first], expr1[id$second,], pmark)

# take those with LOD > 25
expr1s <- expr1[,locallod>25,drop=FALSE]

# calculate distance between individuals
#     (prop'n mismatches between obs and inferred eQTL geno)
d <- disteg(f2cross, expr1s, pmark)

# plot distances
plot(d)

# summary of apparent mix-ups
summary(d)

# plot of classifier for and second eQTL
par(mfrow=c(2,1), las=1)
plotEGclass(d)
plotEGclass(d, 2)




