library(qpcR)


### Name: getPar
### Title: Batch calculation of qPCR fit parameters/efficiencies/threshold
###   cycles with simple output, especially tailored to high-throughput
###   data
### Aliases: getPar
### Keywords: models nonlinear

### ** Examples

## Simple example with fit parameters.
ml1 <- modlist(rutledge, model = l5)
getPar(ml1, type = "fit")

## Using a mechanistic model such as
## 'mak3' and extracting D0 values
## => initial template fluorescence.
ml2 <- modlist(rutledge, 1, 2:41, model = mak3)
res <- getPar(ml2, type = "fit")
barplot(log10(res[1, ]), las = 2)



