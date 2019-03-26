library(GMCM)


### Name: u133VsExon
### Title: Reproducibility between U133 plus 2 and Exon microarrays
### Aliases: u133VsExon
### Keywords: data datasets,

### ** Examples

data(u133VsExon)
str(u133VsExon)

# Plot P-values
plot(u133VsExon, cex = 0.5)

# Plot ranked and scaled P-values
plot(Uhat(1-u133VsExon), cex = 0.5)



