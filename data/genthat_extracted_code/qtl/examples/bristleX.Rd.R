library(qtl)


### Name: bristleX
### Title: Data on bristle number in Drosophila
### Aliases: bristleX
### Keywords: datasets

### ** Examples

data(bristleX)
# Summaries
summary(bristleX)
plot(bristleX)

# genome scan for each of the average phenotypes
bristleX <- calc.genoprob(bristleX, step=2)
out <- scanone(bristleX, pheno.col=c(1,3,5,7))

# Plot the results
    # maximum LOD score among four phenotypes    
ym <- max(apply(out[,-(1:2)], 2, max))
plot(out, lod=1:3, ylim=c(0,ym))
plot(out, lod=4, add=TRUE, col="green")



