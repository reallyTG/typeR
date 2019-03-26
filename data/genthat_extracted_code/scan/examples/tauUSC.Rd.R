library(scan)


### Name: tauUSC
### Title: Tau-U for single-case data
### Aliases: tauUSC

### ** Examples

## Calculate tau-U for the example from Parker et al. (2011)
bob <- makeSCDF(c(2, 3, 5, 3, 4, 5, 5, 7, 6), B.start = 5)
tauUSC(bob)

## Calculate tau-U with ties counted as positive
tauUSC(Grosche2011$Eva, ties.method = "positive")

## Request tau-U for all single-cases fom the Grosche2011 data
lapply(Grosche2011, tauUSC)



