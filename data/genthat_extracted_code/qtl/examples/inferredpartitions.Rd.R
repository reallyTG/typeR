library(qtl)


### Name: inferredpartitions
### Title: Identify inferred partitions in mapping QTL to a phylogenetic
###   tree
### Aliases: inferredpartitions
### Keywords: print

### ** Examples

## Don't show: 
set.seed(66787403)
## End(Don't show)
# example map; drop X chromosome
data(map10)           
map10 <- map10[1:19]
## Don't show: 
map10 <- map10[1:4]
## End(Don't show)

# simulate data
x <- simPhyloQTL(4, partition="AB|CD", crosses=c("AB", "AC", "AD"),
                 map=map10, n.ind=150,
                 model=c(1, 50, 0.5, 0))

# run calc.genoprob on each cross
## Not run: x <- lapply(x, calc.genoprob, step=2)
## Don't show: 
x <- lapply(x, calc.genoprob, step=0)
## End(Don't show)

# scan genome, at each position trying all possible partitions
out <- scanPhyloQTL(x, method="hk")

# inferred partitions
inferredpartitions(out, chr=3, lodthreshold=3)

# inferred partitions with prob'y threshold = 0.95
inferredpartitions(out, chr=3, lodthreshold=3, probthreshold=0.95)



