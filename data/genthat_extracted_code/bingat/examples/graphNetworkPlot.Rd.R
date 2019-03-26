library(bingat)


### Name: graphNetworkPlot
### Title: Graph Network Plots
### Aliases: graphNetworkPlot

### ** Examples

	data(braingraphs)
	
	main <- "Brain Connections"
	gc <- c(5, 5, 4, 6)
	gl <- c("Grp1", "Grp2", "Grp3", "Grp4")
	
	graphNetworkPlot(braingraphs[,1], "adjMatrix", main, groupCounts=gc, groupLabels=gl)



