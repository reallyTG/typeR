library(BAT)


### Name: sim.spatial
### Title: Simulation of species spatial distributions.
### Aliases: sim.spatial

### ** Examples

par(mfrow = c(3 ,3))
comm = sim.spatial(100, 9, distribution = "uniform")
for(i in 1:9){
	sp <- comm[comm[1] == paste("Sp", i, sep = ""), ]
	plot(sp$x, sp$y, main = paste("Sp", i), xlim = c(0,1), ylim = c(0,1))
}
comm = sim.spatial(1000, 9, sad = "lognormal", sd = 0.5, distribution = "aggregated", clust = 2)
for(i in 1:9){
	sp <- comm[comm[1] == paste("Sp", i, sep=""), ]
	plot(sp$x, sp$y, main = paste("Sp", i), xlim = c(0,1), ylim = c(0,1))
}



