library(qpcR)


### Name: pcrGOF
### Title: Summarize measures for the goodness-of-fit
### Aliases: pcrGOF
### Keywords: models nonlinear

### ** Examples

## Single fit without replicates
## including PRESS statistic.
m1 <- pcrfit(reps, 1, 2, l5)
pcrGOF(m1, PRESS = TRUE)

## Fit containing replicates:
## calculation of reduced 
## chi-square included!
m2 <- pcrfit(reps, 1, 2:5, l5)
pcrGOF(m2)



