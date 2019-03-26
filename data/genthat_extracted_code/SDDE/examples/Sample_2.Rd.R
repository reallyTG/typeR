library(SDDE)


### Name: Sample_2
### Title: An network X of 6 nodes and an augmented network Y with 7 nodes
### Aliases: Sample_2
### Keywords: datasets

### ** Examples

## Not run: 
##D 	data(Sample_2)
##D 	complete_network(g1,g2)
## End(Not run)
##          disconnected nodes shortcuts equals detours dead ends
##                           0         0      1       8         6
##          Dead ends or detour total user time system time real time
##                            0    15     0.656       0.049     1.023
# Total new nodes in g2:	1	
# Number of edges in g2:	7	
# Number of nodes in g2:	7	
# Number of nodes in g1:	6	
# ====================================
# x2	x1	Dead
# x3	x2	Dead
# x4	x2	Dead
# x5	x2	Detour
# x3	x1	Dead
# x5	x4	Detour
# x6	x2	Detour
# x4	x1	Dead
# x6	x4	Detour
# x4	x3	Dead
# x5	x1	Detour
# x5	x3	Detour
# x6	x1	Detour
# x6	x3	Detour
# x6	x5	Equal
#====================================        



