library(nonparaeff)


### Name: sbm.tone
### Title: Linear Programming for the Slacks-based Model under the CRS
### Aliases: sbm.tone
### Keywords: Data Envelopment Analysis

### ** Examples

tab7.6.dat <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                              x1 = c(1, 3, 6, 2, 5, 9),
                              x2 = c(4, 1, 1, 8, 5, 2))
(re <- sbm.tone(tab7.6.dat, noutput = 1))



