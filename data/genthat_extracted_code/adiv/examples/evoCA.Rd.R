library(adiv)


### Name: evoCA
### Title: Evolutionary Correspondence Analysis
### Aliases: evoCA plot.evoCA
### Keywords: models

### ** Examples

data(batcomm)
ab <- batcomm$ab
phy <- read.tree(text=batcomm$tre)
plot(phy, show.node=TRUE)
evoCAbat <- evoCA(phy, ab, scan=FALSE, nf=2)
evoCAbat$eig/sum(evoCAbat$eig)
s.label(evoCAbat$li)
s.label(evoCAbat$co)
s.arrow(evoCAbat$co)
inertia.dudi(evoCAbat, row=TRUE)$row.abs
inertia.dudi(evoCAbat, col=TRUE)$col.abs

evoCAbat <- evoCA(phy, ab, scan=FALSE, nf=3) ## All axes are now retained
# The Euclidean (canonical) distances among habitat points on the evoCA space is
dist(evoCAbat$li)
# which is equal to evoDchi2:
evodiss(phy, ab, "chi2")

plot(evoCAbat)

plot(evoCAbat, xaxis=1, yaxis=3)



