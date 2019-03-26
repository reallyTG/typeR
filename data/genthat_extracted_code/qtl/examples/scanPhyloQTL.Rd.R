library(qtl)


### Name: scanPhyloQTL
### Title: Single-QTL genome scan to map QTL to a phylogenetic tree
### Aliases: scanPhyloQTL
### Keywords: models

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

# maximum peak
max(out, format="lod")

# approximate posterior probabilities at peak
max(out, format="postprob")

# all peaks above a threshold for LOD(best) - LOD(2nd best)
summary(out, threshold=1, format="lod")

# all peaks above a threshold for LOD(best), showing approx post'r prob
summary(out, format="postprob", threshold=3)

# plot results
plot(out)



