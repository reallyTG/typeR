library(seedy)


### Name: diversity.range
### Title: Range of genetic diversity over time
### Aliases: diversity.range

### ** Examples

iterations <- 10
K <- diversity.range(m.rate=0.0005, runtime=1000, equi.pop=1000,
iterations=iterations, n.points=100, genomelength=100000, feedback=100, 
makeplot=TRUE, area=TRUE, colline="blue", colarea=rgb(0,0,1,0.4))



