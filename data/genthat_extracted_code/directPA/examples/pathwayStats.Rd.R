library(directPA)


### Name: pathwayStats
### Title: Pathway Level Statistics
### Aliases: pathwayStats

### ** Examples

# load the example data
data(PM)

# load pathway annotations
data(Pathways)

# convert statistics into z-scores
PM.zscores <- apply(PM, 2, function(x){qnorm(rank(x)/(nrow(PM)+1))})

# Rotate the matrix by contrast 1, -1, -1 (i.e. up-regulation, down-regulation, dow-regulation).
PM.rotated <- rotate3d(PM.zscores, contrast = c(1, -1, -1))

# combine rotated statistics across treatments
gene.pvalues <- apply(PM.rotated, 1, geneStats)

# compute statistics for all reactome pathways
gene.zscores <- qnorm(gene.pvalues, lower.tail = FALSE)
gst <- t(sapply(Pathways.reactome, pathwayStats, gene.zscores))




