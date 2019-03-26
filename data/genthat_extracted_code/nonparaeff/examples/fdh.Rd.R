library(nonparaeff)


### Name: fdh
### Title: Linear Programming for the Free Disposable Hull
### Aliases: fdh
### Keywords: Data Envelopment Analysis

### ** Examples

## input-oriented FDH with 1 input and 1 output.
tab7.1.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9),
                              x = c(3, 2, 6, 4, 8, 8, 10))
(re <- fdh(tab7.1.dat, noutput = 1, orientation = 1))

## input-oriented FDH with 2 input and 1 output.
tab7.10.dat <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                               x1 = c(2, 3, 6, 3, 6, 6),
                               x2 = c(5, 3, 1, 8, 4, 2))
(re <- fdh(tab7.10.dat, noutput = 1, orientation = 1))



