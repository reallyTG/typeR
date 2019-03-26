library(TSF)


### Name: StructuralBrekwithLongmemory
### Title: Predicting fractionally differenced series in presence of
###   structural break
### Aliases: StructuralBrekwithLongmemory

### ** Examples

## Simulating Long Memory Series
N <- 1000
PHI <- 0.2
THETA <- 0.1
SD <- 1
M <- 0
D <- 0.2
Seed <- 123
bandwidth<-0.9
set.seed(Seed)
Sim.Series <- fracdiff::fracdiff.sim(n = N, ar = c(PHI), ma = c(THETA),
d = D, rand.gen = rnorm, sd = SD, mu = M)

Xt <- as.ts(Sim.Series$series)

## Forecasting using TSF method
StructuralBrekwithLongmemory(Xt,bandwidth)



