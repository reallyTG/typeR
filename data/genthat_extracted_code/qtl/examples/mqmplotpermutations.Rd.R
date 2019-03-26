library(qtl)


### Name: mqmplot.permutations
### Title: Plot results from mqmpermutation
### Aliases: mqmplot.permutations
### Keywords: hplot

### ** Examples

# Simulated F2 Population
# QTL at chromosome 3
f2qtl <- c(3,15,1,0)

# Mouse genetic map
data(map10)

## Don't show: 
map10 <- map10[1:3]
## End(Don't show)
# Simulate a F2 Cross
f2cross <- sim.cross(map10,f2qtl,n=100,type="f2")
f2cross <- calc.genoprob(f2cross)
## Not run: 
##D # Permutations to obtain significance threshold
##D f2result <- mqmpermutation(f2cross, n.perm=1000, method="permutation")
## End(Not run)## Don't show: 
f2result <- mqmpermutation(f2cross, n.perm=2, batchsize=2, method="permutation")
## End(Don't show)

# Plot results
mqmplot.permutations(f2result)



