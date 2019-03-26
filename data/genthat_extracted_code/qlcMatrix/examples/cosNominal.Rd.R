library(qlcMatrix)


### Name: cosNominal
### Title: Associations-measures for sparsely encoded nominal variables
### Aliases: cosNominal assocNominal cosCol cosRow assocCol assocRow

### ** Examples

# convenience functions are easiest to use
# first a simple example using the farms-dataset from MASS
library(MASS)

# to investigate the relation between the individual values
# This is similar to Multiple Correspondence Analysis (see mca in MASS)
f <- splitTable(farms)
s <- assocCol(f$OV,f$AV)
rownames(s) <- f$values
plot(hclust(as.dist(-s)))



