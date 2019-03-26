library(freqdom.fda)


### Name: fts.rar
### Title: Simulate functional autoregressive processes
### Aliases: fts.rar
### Keywords: simulations

### ** Examples

# Generate a FAR process without burnin (starting from 0)
fts = fts.rar(n = 5, d = 5, burnin = 0)
plot(fts)

# Generate a FAR process with burnin 50 (starting from observations
# already resambling the final distribution)
fts = fts.rar(n = 5, d = 5, burnin = 50)
plot(fts)

# Generate observations with very strong dependance
fts = fts.rar(n = 100, d = 5, burnin = 50, op.norms = 0.999)
plot(fts)



