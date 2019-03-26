library(nonparaeff)


### Name: int.dea
### Title: Linear Programming for the Data Envelopment Analysis with
###   Integer-valued Inputs.
### Aliases: int.dea
### Keywords: Data Envelopment Analysis

### ** Examples

int.dat <- data.frame(y = c(1, 1, 1, 1, 1),
                      x1 = c(2, 7, 3, 7, 9),
                      x2 = c(4, 1, 4, 2, 4))
int.dea(int.dat, noutput = 1, intinput = 1)



