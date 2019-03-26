library(compositions)


### Name: names
### Title: The names of the parts
### Aliases: names.acomp names.aplus names.rcomp names.rplus names.rmult
###   names.ccomp names<-.acomp names<-.ccomp names<-.aplus names<-.rcomp
###   names<-.rplus names<-.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
tmp <- acomp(sa.lognormals)
names(tmp)
names(tmp) <- c("x","y","z")
tmp



