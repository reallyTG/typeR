library(networkDynamic)


### Name: is.active
### Title: Determine Activation State of Edges and Vertices
### Aliases: is.active

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

# are the edges active at a particular time?
is.active(triangle, at=1, e=1:3)
is.active(triangle, at=4, e=seq_along(triangle$mel))

# delete an edge
delete.edges(triangle,e=2)
is.active(triangle, at=4, e=seq_along(triangle$mel))
# gives warning, and only two values returned, which edges are they?
# much safer to use
is.active(triangle, at=4, e=valid.eids(triangle))






