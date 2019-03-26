library(qtl)


### Name: inferFounderHap
### Title: Crude reconstruction of founder haplotypes in multi-parent RIL
### Aliases: inferFounderHap
### Keywords: utilities

### ** Examples

map <- sim.map(100, n.mar=101, include.x=FALSE, eq.spacing=TRUE)
founderGeno <- simFounderSnps(map, "8")
ril <- sim.cross(map, n.ind=10, type="ri8sib", founderGeno=founderGeno)

h <- inferFounderHap(ril, max.n.markers=11)
mean(!is.na(h)) # proportion inferred
plot(map[[1]], h[1,], ylim=c(0.5, 8.5), xlab="Position", ylab="Genotype")



