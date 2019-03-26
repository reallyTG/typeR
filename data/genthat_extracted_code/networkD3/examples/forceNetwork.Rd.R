library(networkD3)


### Name: forceNetwork
### Title: Create a D3 JavaScript force directed network graph.
### Aliases: forceNetwork

### ** Examples

# Load data
data(MisLinks)
data(MisNodes)
# Create graph
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4, zoom = TRUE)

# Create graph with legend and varying node radius
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Nodesize = "size",
             radiusCalculation = "Math.sqrt(d.nodesize)+6",
             Group = "group", opacity = 0.4, legend = TRUE)

# Create graph directed arrows
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4, arrows = TRUE)

## Not run: 
##D #### JSON Data Example
##D # Load data JSON formated data into two R data frames
##D # Create URL. paste0 used purely to keep within line width.
##D URL <- paste0("https://cdn.rawgit.com/christophergandrud/networkD3/",
##D               "master/JSONdata/miserables.json")
##D 
##D MisJson <- jsonlite::fromJSON(URL)
##D 
##D # Create graph
##D forceNetwork(Links = MisJson$links, Nodes = MisJson$nodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 0.4)
##D 
##D # Create graph with zooming
##D forceNetwork(Links = MisJson$links, Nodes = MisJson$nodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 0.4, zoom = TRUE)
##D 
##D 
##D # Create a bounded graph
##D forceNetwork(Links = MisJson$links, Nodes = MisJson$nodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 0.4, bounded = TRUE)
##D 
##D # Create graph with node text faintly visible when no hovering
##D forceNetwork(Links = MisJson$links, Nodes = MisJson$nodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 0.4, bounded = TRUE,
##D              opacityNoHover = TRUE)
##D 
##D ## Specify colours for specific edges
##D # Find links to Valjean (11)
##D which(MisNodes == "Valjean", arr = TRUE)[1] - 1
##D ValjeanInds = which(MisLinks == 11, arr = TRUE)[, 1]
##D 
##D # Create a colour vector
##D ValjeanCols = ifelse(1:nrow(MisLinks) %in% ValjeanInds, "#bf3eff", "#666")
##D 
##D forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 0.8, linkColour = ValjeanCols)
##D 
##D 
##D ## Create graph with alert pop-up when a node is clicked.  You're
##D # unlikely to want to do exactly this, but you might use
##D # Shiny.onInputChange() to allocate d.XXX to an element of input
##D # for use in a Shiny app.
##D 
##D MyClickScript <- 'alert("You clicked " + d.name + " which is in row " +
##D        (d.index + 1) +  " of your original R data frame");'
##D 
##D forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
##D              Target = "target", Value = "value", NodeID = "name",
##D              Group = "group", opacity = 1, zoom = FALSE,
##D              bounded = TRUE, clickAction = MyClickScript)
## End(Not run)




