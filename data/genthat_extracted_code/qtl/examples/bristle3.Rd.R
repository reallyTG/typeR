library(qtl)


### Name: bristle3
### Title: Data on bristle number in Drosophila
### Aliases: bristle3
### Keywords: datasets

### ** Examples

data(bristle3)
# Summaries
summary(bristle3)
plot(bristle3)

# genome scan for each of the average phenotypes
bristle3 <- calc.genoprob(bristle3, step=2)
out <- scanone(bristle3, pheno.col=c(1,3,5,7))

# Plot the results
    # maximum LOD score among four phenotypes    
ym <- max(apply(out[,-(1:2)], 2, max))
plot(out, lod=1:3, ylim=c(0,ym))
plot(out, lod=4, add=TRUE, col="green")



