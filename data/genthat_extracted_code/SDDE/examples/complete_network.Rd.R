library(SDDE)


### Name: complete_network
### Title: compare two given networks (original and augmented, presented as
###   undirected graphs) using a path analysis
### Aliases: complete_network

### ** Examples

## Searching the sample data (containing 11 original nodes and 3 augmented nodes)
data(Sample_1)
result <- complete_network(g1, g2)
print(result)
## Results:
##
##          disconnected nodes shortcuts equals detours dead ends
##user.self                 18         4      5      26         2
##          Dead ends or detour total user time system time real time
##user.self                   0    55     0.997       0.111     2.186
##
## Searching for path x1 -> x2 in the sample data
## Not run: complete_network(g1, g2,node1="x1", node2="x2")
##
## Specifying a limit on time (60 seconds) and maximum distance (2) of 
## an original node to an augmented node
## Not run: complete_network(g1, g2, maxtime=60, maxdistance=2)



