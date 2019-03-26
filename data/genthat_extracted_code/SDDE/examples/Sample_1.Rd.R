library(SDDE)


### Name: Sample_1
### Title: An original network X with 11 nodes and an augmented network Y
###   of 14 nodes
### Aliases: Sample_1
### Keywords: dataset

### ** Examples

## Not run: 
##D 	data(Sample_1)
##D 	complete_network(g1,g2);
## End(Not run)
##        disconnected nodes shortcuts equals detours dead ends
##                        18         4      5      26         2
##        Dead ends or detour total user time system time real time
##                          0    55     0.807       0.081     1.889
## (log.txt with the verbose option)  
# Total new nodes in g2:	3	
# Number of edges in g2:	17	
# Number of nodes in g2:	14	
# Number of nodes in g1:	11	
# ====================================
# x3	x1	Detour
# x4	x2	Detour
# x2	x1	Detour
# x7	x1	Detour
# x7	x3	Detour
# x3	x2	Detour
# x5	x2	Detour
# x4	x1	Detour
# x4	x3	Detour
# x5	x4	Detour
# x7	x2	Detour
# x9	x1	Equal
# x7	x4	Dead
# x9	x3	Detour
# x5	x1	Detour
# x9	x7	Detour
# x10	x2	Disconnected nodes 
# x10	x4	Disconnected nodes 
# x10	x5	Disconnected nodes 
# x5	x3	Detour
# x6	x1	Equal
# x6	x3	Detour
# x5	x7	Detour
# x9	x2	Equal
# x6	x7	Detour
# x6	x9	Detour
# x8	x2	Shortcut
# x9	x4	Detour
# x8	x4	Equal
# x9	x5	Detour
# x10	x1	Disconnected nodes 
# x10	x3	Disconnected nodes 
# x10	x7	Disconnected nodes 
# x10	x9	Disconnected nodes 
# x6	x2	Detour
# x8	x5	Detour
# x8	x10	Disconnected nodes 
# x11	x1	Disconnected nodes 
# x11	x3	Disconnected nodes 
# x11	x7	Disconnected nodes 
# x11	x9	Disconnected nodes 
# x11	x6	Disconnected nodes 
# x6	x4	Detour
# x6	x5	Detour
# x6	x10	Disconnected nodes 
# x8	x1	Shortcut
# x8	x3	Shortcut
# x8	x7	Equal
# x8	x9	Detour
# x8	x6	Shortcut
# x11	x2	Disconnected nodes 
# x11	x4	Disconnected nodes 
# x11	x5	Disconnected nodes 
# x11	x10	Dead end
# x11	x8	Disconnected nodes 
# ====================================



