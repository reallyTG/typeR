library(Rssa)


### Name: igapfill
### Title: Perform SSA gapfilling via iterative reconstruction
### Aliases: igapfill igapfill.ssa igapfill.1d.ssa igapfill.cssa
###   igapfill.toeplitz.ssa igapfill.nd.ssa

### ** Examples

# Produce series with gaps
F <- co2; F[100:200] <- NA
# Perform shaped SSA
s <- ssa(F, L = 72)
# Fill in gaps using the trend and 2 periodicty components
# Due to trend, provide a linear filler to speedup the process
fill <- F; fill[100:200] <- F[99] + (1:101)/101*(F[201] - F[99])
g <- igapfill(s, groups = list(1:6), fill = fill, maxit = 50)
# Compare the result
plot(g)
lines(co2, col = "red")



