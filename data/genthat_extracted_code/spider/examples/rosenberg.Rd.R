library(spider)


### Name: rosenberg
### Title: Rosenberg's probability of reciprocal monophyly
### Aliases: rosenberg
### Keywords: Sampling

### ** Examples


data(anoteropsis)
anoTr <- ape::nj(ape::dist.dna(anoteropsis))
anoLab <- rosenberg(anoTr)
ape::plot.phylo(anoTr)
ape::nodelabels(round(anoLab,3), node=as.numeric(names(anoLab)))

data(dolomedes)
doloTr <- ape::nj(ape::dist.dna(dolomedes))
doloRose <- rosenberg(doloTr)
ape::plot.phylo(doloTr)
ape::nodelabels(round(doloRose, 3))

#Colour circles for nodes with a probability < 0.005
doloNodes <- doloRose < 0.005
doloLabs <- doloRose
doloLabs[doloNodes] <- "blue"
doloLabs[!doloNodes] <- "red"
ape::plot.phylo(doloTr, cex=0.7)
ape::nodelabels(pch=21, bg=doloLabs, node=as.numeric(names(doloLabs)), cex=2)
graphics::legend(x=0.015, y=16.13, legend=c("significant", "not significant"), pch=21, 
    pt.bg=c("blue", "red"), bty="n", pt.cex=2)




