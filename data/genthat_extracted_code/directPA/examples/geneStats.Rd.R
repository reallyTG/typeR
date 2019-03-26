library(directPA)


### Name: geneStats
### Title: Molecule Level Statistics
### Aliases: geneStats

### ** Examples

# load the example data
data(PM)

# convert statistics into z-scores
PM.zscores <- apply(PM, 2, function(x){qnorm(rank(x)/(nrow(PM)+1))})

# Rotate the matrix by contrast 1, -1, -1 (i.e. up-regulation, down-regulation, dow-regulation).
PM.rotated <- rotate3d(PM.zscores, contrast = c(1, -1, -1))

# combine rotated statistics across treatments
gene.pvalues <- apply(PM.rotated, 1, geneStats)




