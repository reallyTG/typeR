library(SDDE)


### Name: load_network
### Title: is a helper function to load networks from files
### Aliases: load_network

### ** Examples

	## Load a network from files. 
	## Not run: 
##D 		network=load_network('graph.txt','graph_tax.txt','equal')
##D 		info_network(network$g1,network$g2);
##D 	
## End(Not run)
	# We expect the network to be a series of nodes as tab-separated values.
	#
	# Example graph.txt:
	# node1	node2  edge weight	
	# x1	x2	   	1
	# x2	x3		1
	# x3	x6		1
	# x1	x5		1
	# x5	x6		1	
	#
	# Example graph_tax.txt
	# x1	plasmid 
	# x2	plasmid
	# x3	bacteria
	# x4	plasmid
	# x5	bacteria
	# x6	virus



