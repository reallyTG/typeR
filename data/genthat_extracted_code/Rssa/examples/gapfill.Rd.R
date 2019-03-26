library(Rssa)


### Name: gapfill
### Title: Perform SSA gapfilling via forecast
### Aliases: gapfill gapfill.1d.ssa gapfill.toeplitz.ssa gapfill.mssa
###   gapfill.cssa

### ** Examples

# Produce series with gaps
F <- co2; F[100:200] <- NA
# Perform shaped SSA
s <- ssa(F, L = 72)
# Fill in gaps using the trend and 2 periodicty components
g <- gapfill(s, groups = list(1:6))
# Compare the result
plot(g)
lines(co2, col = "red")



