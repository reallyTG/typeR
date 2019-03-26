library(qtl)


### Name: plotLodProfile
### Title: Plot 1-d LOD profiles for a multiple QTL model
### Aliases: plotLodProfile
### Keywords: hplot

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(2,5))
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=2)
qtl <- makeqtl(fake.bc, chr=c(2,5), pos=c(32.5, 17.5), what="prob")

out <- scanone(fake.bc, method="hk")

# refine QTL positions and keep LOD profiles
rqtl <- refineqtl(fake.bc, qtl=qtl, method="hk", keeplodprofile=TRUE)

# plot the LOD profiles
plotLodProfile(rqtl)

# add the initial scan results, for comparison
plot(out, add=TRUE, chr=c(2,5), col="red")



