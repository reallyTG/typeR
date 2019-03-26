library(networkDynamic)


### Name: activate
### Title: Dynamic Activation and Inactivation of Edges and Vertices
### Aliases: activate activate.edges activate.vertices deactivate.edges
###   deactivate.vertices
### Keywords: ~kwd1 ~kwd2

### ** Examples

triangle <- network.initialize(3)  # create a toy network
add.edge(triangle,1,2)    # add an edge between vertices 1 and 2
add.edge(triangle,2,3)    # add more edges
add.edge(triangle,3,1)

# turn on all edges at time 1 only (0 length spell)
activate.edges(triangle,at=1) 

# activate edge (1,2) from t=2 to t=3
activate.edges(triangle,onset=2, terminus=3,
               e=get.edgeIDs(triangle,v=1,alter=2))
               
# activate edge (2,3) from t=4 for 2 time lengths
activate.edges(triangle,onset=4, length=2, 
               e=get.edgeIDs(triangle,v=2,alter=3))
               
deactivate.edges(triangle, at=2, e=1) # does not work since the spell is not 0-length
is.active(triangle, at=2, e=1:3)

deactivate.edges(triangle, e=1, onset=2, length=0.1)  # this deactivates the vertex
is.active(triangle, at=2, e=1:3)  

# this activates edges 2 and 3 at time 5
activate.edges(triangle, e=2:3, at=5)

# this activates edge 1 at multiple times;
deactivate.edges(triangle)
activate.edges(triangle, e=c(1,1,1), at=6:8)
is.active(triangle, at=6, e=1:3)
is.active(triangle, at=7, e=1:3)
is.active(triangle, at=8, e=1:3)

# this activates vertex 1 for two spells, (0,1) and (3,4)
test <- network.initialize(3)
activate.vertices(test,onset=0:3,terminus=1:4,v=c(1,2,3,1))
get.vertex.activity(test, as.spellList=TRUE)





