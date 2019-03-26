library(rEMM)


### Name: plot
### Title: Visualize EMM Objects
### Aliases: plot,EMM,missing-method plot
### Keywords: hplot

### ** Examples

data("EMMTraffic")
emm <- EMM(threshold=0.2, measure="eJaccard", data=EMMTraffic)

op <- par(mfrow = c(2, 2), pty = "s")
plot(emm, main="Graph (plain)", 
    parameter=list(cluster_counts=FALSE, arrow_width=FALSE))
plot(emm, main="Graph")
plot(emm, method="MDS", main="MDS projection", 
    xlim=c(-0.5,0.5), ylim= c(-0.5,0.5))
plot(emm, method="MDS", data = EMMTraffic, 
	main = "Projection of centers on data")
par(op)

## Example to create a fixed layout for igraph
g <- as.igraph(emm)
l <- layout.star(g)
plot(emm, layout=l)



