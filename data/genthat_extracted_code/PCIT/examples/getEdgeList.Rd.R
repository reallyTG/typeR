library(PCIT)


### Name: getEdgeList
### Title: Converts an adjacency matrix into edge list representation
### Aliases: getEdgeList

### ** Examples

	data(PCIT)
	m <- m[1:200,1:200]        # just use a small subset of the data
	
	el <- getEdgeList(m)
	
	# modify the edge list to include some useful attributes for cytoscape
	el$sign[el$Weight<0] <- '-'
	el$sign[el$Weight>0] <- '+'
	el$Weight <- abs(el$Weight)
	# write the edge list stuff to a file suitable for import into cytoscape
	write.table(el, file="el.txt", row.names=FALSE, col.names=TRUE, sep="\t",
		quote=FALSE)



