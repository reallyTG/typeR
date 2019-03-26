library(adiv)


### Name: evopca
### Title: Evolutionary Principal Component analyses
### Aliases: evopcachord evopcahellinger
### Keywords: models

### ** Examples

data(batcomm)
ab <- batcomm$ab
phy <- read.tree(text=batcomm$tre)
plot(phy, show.node=TRUE)

evopcaHbat <- evopcahellinger(phy, ab, scan=FALSE, nf=3)
dist(evopcaHbat$li)
evodiss(phy, ab, "Hellinger")

evopcaHbat$eig/sum(evopcaHbat$eig)
s.label(evopcaHbat$li)
s.label(evopcaHbat$co)
s.arrow(evopcaHbat$co)
inertia.dudi(evopcaHbat, row=TRUE)$row.abs
inertia.dudi(evopcaHbat, col=TRUE)$col.abs

evopcaCbat <- evopcachord(phy, ab, scan=FALSE, nf=3)
dist(evopcaCbat$li)
evodiss(phy, ab, "Chord")

evopcaCbat$eig/sum(evopcaCbat$eig)
s.label(evopcaCbat$li)
s.label(evopcaCbat$co)
s.arrow(evopcaCbat$co)
inertia.dudi(evopcaCbat, row=TRUE)$row.abs
inertia.dudi(evopcaCbat, col=TRUE)$col.abs



