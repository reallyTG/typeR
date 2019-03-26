library(eggCounts)


### Name: simData2s
### Title: Simulate faecal egg count data (2-sample situation)
### Aliases: simData2s
### Keywords: simulation

### ** Examples

fec <- simData2s(n=10, preMean=500, delta=0.1, kappa=0.5)

## show the positive bias when the true reduction should be 95%
set.seed(1)
fec <- simData2s(n=1e5, preMean=150, delta=0.05, kappa=0.5)
1-mean(fec$masterPost)/mean(fec$masterPre)



