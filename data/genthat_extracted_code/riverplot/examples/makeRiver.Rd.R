library(riverplot)


### Name: makeRiver
### Title: Create a new riverplot object
### Aliases: makeRiver

### ** Examples

nodes <- c( LETTERS[1:3] )
edges <- list( A= list( C= 10 ), B= list( C= 10 ) )
r <- makeRiver( nodes, edges, node_xpos= c( 1,1,2 ),
  node_labels= c( A= "Node A", B= "Node B", C= "Node C" ),
  node_styles= list( A= list( col= "yellow" )) )
plot( r )

# equivalent form:
nodes <- data.frame( ID= LETTERS[1:3],
               x= c( 1, 1, 2 ),
               col= c( "yellow", NA, NA ),
               labels= c( "Node A", "Node B", "Node C" ),
               stringsAsFactors= FALSE )
r <- makeRiver( nodes, edges )
plot( r )
# all nodes but "A" will be red:
r <- makeRiver( nodes, edges, default_style= list( col="red" ) )
plot( r )
# overwrite the node information from "nodes":
r <- makeRiver( nodes, edges, node_styles= list( A=list( col="red" ) ) )
plot( r )



