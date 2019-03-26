library(mdatools)


### Name: randtest
### Title: Randomization test for PLS regression
### Aliases: randtest

### ** Examples

### Examples of using the test

## Get the spectral data from Simdata set and apply SNV transformation

data(simdata)

y = simdata$conc.c[, 3]
x = simdata$spectra.c
x = prep.snv(x)

## Run the test and show summary 
## (normally use higher nperm values > 1000)
r = randtest(x, y, ncomp = 4, nperm = 200, silent = FALSE)
summary(r)

## Show plots

par( mfrow = c(3, 2))
plot(r)
plotHist(r, comp = 3)
plotHist(r, comp = 4)
plotCorr(r, 3)
plotCorr(r, 4)
par( mfrow = c(1, 1))




