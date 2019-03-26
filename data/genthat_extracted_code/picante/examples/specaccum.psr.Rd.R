library(picante)


### Name: specaccum.psr
### Title: Phylogenetic Species Richness Sample-Based Rarefaction Curve
### Aliases: specaccum.psr
### Keywords: univar

### ** Examples

data(phylocom)
accum.sr<-specaccum(phylocom$sample, permutations = 100, method = "random")
plot(accum.sr, col="blue")
points(accum.sr$sites, accum.sr$richness, pch=19, col="blue")

accum.psr<-specaccum.psr(phylocom$sample, phylocom$phylo, permutations = 100, method = "random")
plot(accum.psr, add=TRUE, col = "red")
points(accum.psr$sites, accum.psr$richness, pch=19, col="red")

legend(5,5,legend=c("SR","PSR"),pch=c(19,19),col=c("blue","red"))



