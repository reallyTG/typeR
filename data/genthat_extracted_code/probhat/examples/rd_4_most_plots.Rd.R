library(probhat)


### Name: rd_4_most_plots
### Title: Most Plots
### Aliases: plot.nppdfuv plot.npcdfuv plot.npcdfuv.inverse plot.nppdfc
###   plot.npcdfc plot.npcdfc.inverse plot.eccdf plot.eccdf.inverse
###   plot.reglike lines.nppdfuv lines.npcdfuv lines.npcdfuv.inverse
###   lines.nppdfc lines.npcdfc lines.npcdfc.inverse lines.eccdf
###   lines.eccdf.inverse lines.reglike

### ** Examples

data (trees)
nppdfuv.f = nppdfuv (trees$Height)
plot (nppdfuv.f, TRUE)



