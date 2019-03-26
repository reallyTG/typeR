library(Rssa)


### Name: residuals
### Title: Obtain the residuals from SSA reconstruction
### Aliases: residuals.ssa residuals.ssa.reconstruction

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Reconstruct the series, grouping elementary series.
r <- reconstruct(s, groups = list(c(1, 4), c(2,3), c(5, 6)))
print(residuals(r))

# If there are several groups, then the residuals are calculated as
# residuals for the model corresponding to the combined model.
r <- reconstruct(s, groups = list(c(6, 7), c(6,7), c(8, 9)))
r1 <- reconstruct(s, groups = list(6:9))
max(abs(residuals(r) - residuals(r1))) # 0 
max(abs(co2 - (r1$F1 + residuals(r1)))) # 0



