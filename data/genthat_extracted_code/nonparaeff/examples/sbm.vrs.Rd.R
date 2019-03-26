library(nonparaeff)


### Name: sbm.vrs
### Title: Linear Programming for the Slacks-based Model under the VRS
### Aliases: sbm.vrs
### Keywords: Data Envelopment Analysis

### ** Examples

tab7.6.dat <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                              x1 = c(1, 3, 6, 2, 5, 9),
                              x2 = c(4, 1, 1, 8, 5, 2))
(re <- sbm.vrs(tab7.6.dat, noutput = 1))



