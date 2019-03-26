library(SDDE)


### Name: info_node
### Title: returns additional information regarding the nodes of networks X
###   and Y (original and augmented)
### Aliases: info_node

### ** Examples

   ## Report reachability informations about the node in sample1
   ## Not run: 
##D    data(Sample_1)
##D    info_node(g1,g2)
##D    
## End(Not run)
   ## Results:
   ## Total of pathways to investigate: 55 
   ## Number of edges in network Y: 17 
   ## Number of nodes in network Y: 14 
   ## Number of nodes in network X: 11 
   ## Nodes distribution in network Y (first row taxa, second row count):
   ## 1  2 
   ## 11  3 
   ## $reach_count
   ## [1] 3 3 3 3 3 3 0 3 3 0 3 3 3 3 3 0 3 3 0 3 3 3 3 0 3 3 0 0 3 3 0 3 3 0 3 3 0 3
   ## [39] 3 0 3 0 3 3 0 0 3 3 0 0 0 0 3 0 0
   ##  $reach_max_dist
   ## [1] 3 3 3 3 3 1 0 3 1 0 3 3 3 1 1 0 3 1 0 3 3 3 3 0 3 3 0 0 3 1 0 3 1 0 3 1 0 3
   ## [39] 1 0 1 0 3 1 0 0 1 1 0 0 0 0 1 0 0
   ## $reach_min_dist
   ## [1] 2 1 2 2 2 2 0 2 2 0 1 1 1 2 3 0 2 3 0 1 1 1 2 0 1 2 0 0 2 2 0 2 2 0 2 2 0 2
   ## [39] 2 0 2 0 2 2 0 0 2 2 0 0 0 0 2 0 0
   ## $reach_mean_dist
   ##  [1] 2 2 2 2 2 2 0 2 2 0 2 2 2 2 2 0 2 2 0 2 2 2 2 0 2 2 0 0 2 2 0 2 2 0 2 2 0 2
   ## [39] 2 0 2 0 2 2 0 0 2 2 0 0 0 0 2 0 0   



