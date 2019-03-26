library(directPA)


### Name: perturbPlot2d
### Title: Perturbation Plot
### Aliases: perturbPlot2d

### ** Examples

# load the phosphoproteomics dataset
data(HEK)

# load the kinase-substrate annoations
data(PhosphoSite)

perturbPlot2d(Tc=HEK, annotation=PhosphoSite.mouse, cex=3)




