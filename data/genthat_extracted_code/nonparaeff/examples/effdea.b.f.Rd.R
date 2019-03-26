library(nonparaeff)


### Name: effdea.b.f
### Title: Linear Programming for the Data Envelopment Analysis
### Aliases: effdea.b.f
### Keywords: Data Envelopment Analysis

### ** Examples

## input-oriented DEA under the CRS assumption (1 input and 1 output)
tab3.1.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9), 
                         x = c(3, 2, 6, 4, 8, 8, 10))
(re <- effdea.b.f(base = tab3.1.dat, noutput = 1, orientation = 1, rts =
1, convhull = TRUE))



