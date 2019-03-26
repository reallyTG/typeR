library(adiv)


### Name: evoNSCA
### Title: Evolutionary Non-Symmetric Correspondence Analysis
### Aliases: evoNSCA
### Keywords: models

### ** Examples

data(batcomm)
ab <- batcomm$ab
phy <- read.tree(text=batcomm$tre)
plot(phy, show.node=TRUE)
evoNSCAbat <- evoNSCA(phy, ab, scan=FALSE, nf=2)
evoNSCAbat$eig/sum(evoNSCAbat$eig)
s.label(evoNSCAbat$li)
s.label(evoNSCAbat$co)
s.arrow(evoNSCAbat$co)
inertia.dudi(evoNSCAbat, row=TRUE)$row.abs
inertia.dudi(evoNSCAbat, col=TRUE)$col.abs

evoNSCAbat <- evoNSCA(phy, ab, scan=FALSE, nf=3) ## All axes are now retained
# The Euclidean (canonical) distances among habitat points on the evoNSCA space is
dist(evoNSCAbat$li)
# which is equal to evoDprofile (see function \code{evodiss}):
evodiss(phy, ab, "LG")



