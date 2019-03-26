library(pez)


### Name: scape
### Title: Simulate phylogenetic community structure across a landscape
### Aliases: scape

### ** Examples

#Create balanced tree with equal branch-lengths (signal in centers)
tree <- stree(8,type="balanced")
tree$edge.length <- rep(1, nrow(tree$edge))
tree$root <- 1
kk <- scape(tree, scape.size=100, g.center=100, g.range=1, g.repulse=1, wd.all=150,
    signal.center=TRUE, signal.range=FALSE, same.range=FALSE, repulse=FALSE,center.scale = 1,
    range.scale = 1, repulse.scale = 1, site.stoch.scale = 0, sd.center=3, sd.range=1,
    rho=NULL, th=20)

#Make some plots
par(mfrow=c(1,Ntip(tree)),mar=c(.1,.1,.1,.1))
for(j in seq_along(tree$tip.label))
    image(t(1 - kk$sppXs[,,j]/max(kk$sppXs[,,j])), xlab = "",
              ylab = "",main = "",axes=FALSE, col=grey.colors(10))

par(mfrow=c(2,1))
matplot((kk$X1), type = "l", xlab="gradient",ylab = "probability",
main = "Gradient 1",col=rainbow(dim(kk$X1)[2]),lty=1)
matplot((kk$X2), type = "l", xlab="gradient",ylab = "probability",
main = "Gradient 2",col=rainbow(dim(kk$X2)[2]),lty=1)

plot(x=seq_along(sites(kk$cc)),y = rowSums(comm(kk$cc)), main = "SR",type = "l")
cor(kk$X1)



