library(SDDE)


### Name: random_network
### Title: creates random augmented networks X and Y
### Aliases: random_network

### ** Examples

	## Create a small random_network
	## Not run: 
##D 		random_network()
##D 	
## End(Not run)
	## Expected result:
	#
	#  $g1
	#   IGRAPH UNW- 25 23 -- Erdos renyi (gnm) graph
	#   + attr: name (g/c), type (g/c), loops (g/l), m (g/n), name (v/c), tax
	#    (v/c), weight (e/n)
	#
	#  $g2
	#   IGRAPH UNW- 30 30 -- Erdos renyi (gnm) graph
	#   + attr: name (g/c), type (g/c), loops (g/l), m (g/n), name (v/c), tax
	#    (v/c), weight (e/n)
	#
	#   $total_nodes
	#	[1] 30
	#
	#	$total_edges
	# 	[1] 30
	#
	#   $total_original_nodes
	#   [1] 25
	#
	## Create two networks using the Erdos-Renyi model with 100 nodes in network X 
	## and 10 additional nodes in network Y of 3 types. 
	random_network(100,10,3);
	## Create a random networks of 20 +10 additional node using the  Barabsi-Albert model
	## and compute the corresponding SDDE path types.
	## l <- random_network(20,10,ngroup=1,vertex_ratio=1, type='barabasi');
	## complete_network(l$g1, l$g2);



