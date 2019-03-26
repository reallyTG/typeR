library(wevid)


### Name: plotcumfreqs
### Title: Plot the cumulative frequency distributions in cases and in
###   controls
### Aliases: plotcumfreqs

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))
plotcumfreqs(densities)




