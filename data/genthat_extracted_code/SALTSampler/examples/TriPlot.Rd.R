library(SALTSampler)


### Name: TriPlot
### Title: Plots MCMC Samples on a 3-Simplex
### Aliases: TriPlot

### ** Examples

#Dirichlet triangle plot
dir <- RunMh(center = c(0.7, 0.2, 0.1), B = 2e3, concentration = 10,
                        h = c(2, 2, 2), type = 'dirichlet', dat = NULL)
TriPlot(mhOut = dir, sumStat = TRUE)



