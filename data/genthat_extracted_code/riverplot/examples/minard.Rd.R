library(riverplot)


### Name: minard
### Title: Minard Napoleon Russian campaign data
### Aliases: minard

### ** Examples

data( minard )
nodes <- minard$nodes
edges <- minard$edges
colnames( nodes ) <- c( "ID", "x", "y" )
colnames( edges ) <- c( "N1", "N2", "Value", "direction" )

# color the edges by troop movement direction
edges$col <- c( "#e5cbaa", "black" )[ factor( edges$direction ) ]
# color edges by their color rather than by gradient between the nodes
edges$edgecol <- "col"

# generate the riverplot object and a style
river <- makeRiver( nodes, edges )
style <- list( edgestyle= "straight", nodestyle= "invisible" )

# plot the generated object
plot( river, lty= 1, default_style= style )
# Add cities
with( minard$cities, points( Longitude, Latitude, pch= 19 ) )
with( minard$cities, text( Longitude, Latitude, Name, adj= c( 0, 0 ) ) )




