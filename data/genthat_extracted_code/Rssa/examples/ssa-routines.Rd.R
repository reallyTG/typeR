library(Rssa)


### Name: ssa-object
### Title: Properties of SSA object
### Aliases: ssa-object nlambda nsigma nu nv nspecial nspecial.ssa
###   summary.ssa $.ssa contributions

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2, neig = 20)
# Show the number of eigentriples saved in the 's'
print(nsigma(s))
# Show the summary 
summary(s)
# Show the set of singular values
print(s$sigma)
# Show the first eigenvector
print(s$U[, 1])

# Decompose `co2' series with polynomial projections
s <- ssa(co2, row.projector = 1, column.projector = 2)
print(nspecial(s))
print(c(s$nPL, s$nPR))
# Reconstruct a polynomial trend
plot(reconstruct(s, groups = list(trend = seq_len(nspecial(s)))))



