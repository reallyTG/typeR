library(emon)


### Name: GVFCMOM
### Title: Function to calculate the method of moments visual fast count
###   estimator
### Aliases: GVFCMOM
### Keywords: Visual Fast Count

### ** Examples

counts = c(0, 0, 0, 0, 1, 1, 1, 2, 1)
GVFCMOM(counts, s=9, d=2, method='nb', lowint=0, highint=100)
GVFCMOM(counts, s=9, d=1, method='nb', lowint=0, highint=100)
GVFCMOM(counts, s=9, d=1, method='pois', lowint=0, highint=100)



