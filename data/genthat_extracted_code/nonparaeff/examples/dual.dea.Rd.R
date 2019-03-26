library(nonparaeff)


### Name: dual.dea
### Title: Linear Programming for the Dual Data Envelopment Analysis
### Aliases: dual.dea
### Keywords: Data Envelopment Analysis

### ** Examples

## An output-oriented primal problem with 1 input and 2 outputs
tab5.1.dat <- data.frame(y1 = c(4, 8, 8, 4, 3, 1),
                               y2 = c(9, 6, 4, 3, 5, 6),
                               x = c(1, 1, 1, 1, 1, 1))
(re <- dea(tab5.1.dat, noutput = 2, orientation = 2, rts = 1))

## An output-oriented dual problem with 1 input and 2 outputs
re <- dual.dea(tab5.1.dat, noutput = 2, orientation = 2, rts = 1)



