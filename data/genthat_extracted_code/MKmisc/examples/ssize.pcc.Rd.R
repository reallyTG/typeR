library(MKmisc)


### Name: ssize.pcc
### Title: Sample Size Planning for Developing Classifiers Using High
###   Dimensional Data
### Aliases: ssize.pcc
### Keywords: htest

### ** Examples

## see Table 2 of Dobbin et al. (2008)
g <- 0.1
fc <- 1.6
ssize.pcc(gamma = g, stdFC = fc, nrFeatures = 22000)

## see Table 3 of Dobbin et al. (2008)
g <- 0.05
fc <- 1.1
ssize.pcc(gamma = g, stdFC = fc, nrFeatures = 22000)



