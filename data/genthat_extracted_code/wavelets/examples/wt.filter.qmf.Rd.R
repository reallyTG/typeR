library(wavelets)


### Name: wt.filter.qmf
### Title: Quadrature Mirror Filter
### Aliases: wt.filter.qmf
### Keywords: ts

### ** Examples

# obtain both the la8 wavelet and scaling filters
la8 <- wt.filter("la8")

# now compare output of qmf with values in wt.filter object
wt.filter.qmf(la8@h)
la8@g



