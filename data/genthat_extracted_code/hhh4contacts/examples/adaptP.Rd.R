library(hhh4contacts)


### Name: adaptP
### Title: Adapt a Transition Matrix to a Specific Stationary Distribution
### Aliases: adaptP

### ** Examples

## a row-normalized contact matrix
C <- matrix(c(0.8, 0.1, 0.1,
              0.2, 0.6, 0.2,
              0.1, 0.2, 0.7), byrow=TRUE, ncol=3, nrow=3)
stationary(C)
## population fractions define the target distribution
popfracs <- c(0.4, 0.3, 0.3)
## adapt 'C' to the given population fractions
Cpop <- adaptP(C, popfracs, niter = 50000)
stationary(Cpop)
## this method increases the diagonal values of 'C'
round(C, 3)
round(Cpop, 3)
round(Cpop/C, 3)



