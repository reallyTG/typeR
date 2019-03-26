library(R2HTML)


### Name: HTMLInsertGraph
### Title: Insert a graph in a HTML report
### Aliases: HTMLInsertGraph
### Keywords: print IO file

### ** Examples


	directory=getwd()
	HTMLoutput=file.path(directory,"output.html")
	graph1="graph1.png"
	# Write graph to a file
	## Not run: png(file.path(directory,graph1))
	## Not run: plot(table(rpois(100,5)), type = "h", col = "red", lwd=10,main="rpois(100,lambda=5)")
	## Not run: dev.off()
	# Insert graph to the HTML output
	HTMLInsertGraph(graph1,file=HTMLoutput,caption="Sample discrete distribution plot")



