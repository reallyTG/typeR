library(spatstat)


### Name: quadrat.test.splitppp
### Title: Dispersion Test of CSR for Split Point Pattern Based on Quadrat
###   Counts
### Aliases: quadrat.test.splitppp
### Keywords: spatial htest

### ** Examples

 data(humberside)
 qH <- quadrat.test(split(humberside), 2, 3)
 plot(qH)
 qH



