library(freqdom.fda)


### Name: fts.rma
### Title: Simulate functional moving average processes
### Aliases: fts.rma
### Keywords: simulations

### ** Examples

# Generate a FMA process without burnin (starting from 0)
fts = fts.rma(n = 5, d = 5)
plot(fts)

# Generate observations with very strong dependance
fts = fts.rma(n = 100, d = 5, op.norms = 0.999)
plot(fts)

# Generate observations with very strong dependance and noise
# from the multivariate t distribution
fts = fts.rma(n = 100, d = 5, op.norms = 0.999, noise = "mt")
plot(fts)



