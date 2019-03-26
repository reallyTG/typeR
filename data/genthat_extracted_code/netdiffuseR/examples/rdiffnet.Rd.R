library(netdiffuseR)


### Name: rdiffnet
### Title: Random diffnet network
### Aliases: rdiffnet rdiffnet_multiple

### ** Examples

# Asimple example -----------------------------------------------------------
set.seed(123)
z <- rdiffnet(100,10)
z
summary(z)

# A more complex example: Adopt if at least one neighbor has adopted --------
y <- rdiffnet(100, 10, threshold.dist=function(x) 1,
    exposure.args=list(valued=FALSE, normalized=FALSE))

# Re thinking the Adoption of Tetracycline ----------------------------------
newMI <- rdiffnet(seed.graph = medInnovationsDiffNet$graph,
 threshold.dist = threshold(medInnovationsDiffNet), rewire=FALSE)


# Simulation study comparing the diffusion with diff sets of seed nodes -----

# Random seed nodes
set.seed(1)
ans0 <- rdiffnet_multiple(R=50, statistic=function(x) sum(!is.na(x$toa)),
    n = 100, t = 4, seed.nodes = "random", stop.no.diff=FALSE)

# Central seed nodes
set.seed(1)
ans1 <- rdiffnet_multiple(R=50, statistic=function(x) sum(!is.na(x$toa)),
    n = 100, t = 4, seed.nodes = "central", stop.no.diff=FALSE)

boxplot(cbind(Random = ans0, Central = ans1), main="Number of adopters")



