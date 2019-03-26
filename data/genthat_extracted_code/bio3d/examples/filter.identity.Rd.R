library(bio3d)


### Name: filter.identity
### Title: Percent Identity Filter
### Aliases: filter.identity
### Keywords: utilities

### ** Examples

attach(kinesin)

ide.mat <- seqidentity(pdbs)

# Histogram of pairwise identity values
op <- par(no.readonly=TRUE)
par(mfrow=c(2,1))
hist(ide.mat[upper.tri(ide.mat)], breaks=30,xlim=c(0,1),
     main="Sequence Identity", xlab="Identity")

k <- filter.identity(ide=ide.mat, cutoff=0.6)
ide.cut <- seqidentity(pdbs$ali[k$ind,])
hist(ide.cut[upper.tri(ide.cut)], breaks=10, xlim=c(0,1),
     main="Sequence Identity", xlab="Identity")

#plot(k$tree, axes = FALSE, ylab="Sequence Identity")
#print(k$ind) # selected
par(op)
detach(kinesin)



