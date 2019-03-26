library(LSD)


### Name: singlemsdplot
### Title: Visualize two-dimensional data clusters (add to an existing
###   plot)
### Aliases: LSD.singlemsdplot singlemsdplot
### Keywords: mean, sd

### ** Examples

samples = 100
probes = 200
clus = matrix(rnorm(probes*samples,sd=1),ncol=probes)

clus = rbind(
	t(t(clus)+sin(1:probes/10))+1:nrow(clus)/samples,
	t(t(clus)+sin(pi/2+1:probes/10))+1:nrow(clus)/samples)

emptyplot(xlim = c(1,ncol(clus)),ylim = range(clus))
singlemsdplot(clus)
axis(1)
axis(2)
box()



