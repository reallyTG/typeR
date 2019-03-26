library(SALTSampler)


### Name: Diagnostics
### Title: Plots and Summaries of RunMh Output
### Aliases: Diagnostics

### ** Examples

#Dirichlet run and diagnostic plots
dir <- RunMh(center = c(0.7, 0.2, 0.1), B = 2e3, concentration = 10,
                        h = c(2, 2, 2), type = 'dirichlet', dat = NULL)
Diagnostics(mhOut = dir)



