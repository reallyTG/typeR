library(wevid)


### Name: prop.belowthreshold
### Title: Proportions of cases and controls below a threshold of weight of
###   evidence
### Aliases: prop.belowthreshold

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))
w.threshold <- log(4) # threshold Bayes factor of 4
prop.belowthreshold(densities, w.threshold)




