library(EcoGenetics)


### Name: eco.weight
### Title: Spatial weights
### Aliases: eco.weight

### ** Examples


## Not run: 
##D 
##D data(eco3)
##D 
##D # 1)  "circle" method
##D 
##D con <- eco.weight(eco3[["XY"]], method = "circle", d1 = 0, d2 = 500)
##D 
##D 
##D #---- Different plot styles for the graph ----#
##D 
##D # simple
##D eco.plotWeight(con, type = "simple") 
##D             
##D # igraph
##D eco.plotWeight(con, type = "igraph", group = eco3[["S"]]$structure)
##D 
##D # network (interactive)
##D ## click in a node to see the label
##D eco.plotWeight(con, type = "network", bounded = TRUE, group = eco3[["S"]]$structure)
##D 
##D # edgebundle (interactive)
##D ## in the following plot, the assignment a group factor, 
##D ## generates clustered nodes.
##D ## hover over the nodes to see the individual connections
##D eco.plotWeight(con, type = "edgebundle", fontSize=8, group = eco3[["S"]]$structure)
##D 
##D 
##D # 2) "knearest" method
##D 
##D con <- eco.weight(eco3[["XY"]], method = "knearest", k = 10)
##D eco.plotWeight(con) 
##D eco.plotWeight(con, type = "network", bounded = TRUE, group = eco3[["S"]]$structure)
##D 
##D # 3)  "inverse" method
##D ## scale dependent. In the example, the original coordinates (in km) are converted into m
##D con <- eco.weight(eco3[["XY"]]/1000, method = "inverse", max.sd = TRUE, p = 0.1)
##D con
##D eco.plotWeight(con)
##D 
##D # 4) "circle.inverse" method
##D con <- eco.weight(eco3[["XY"]], method = "circle.inverse", d2 = 1000)
##D con
##D eco.plotWeight(con)
##D 
##D # 5) "exponential" method
##D ## scale dependent. In the example, the original coordinates (in km) are converted into m
##D con <- eco.weight(eco3[["XY"]]/1000, method = "exponential", max.sd = TRUE, alpha = 0.1)
##D eco.plotWeight(con)
##D 
##D # 6) "circle.exponential" method
##D con <- eco.weight(eco3[["XY"]], method = "circle.exponential", d2 = 2000)
##D con
##D eco.plotWeight(con)
##D 
##D 
##D # 7) CUSTOM WEIGHT MATRIX
##D 
##D ## An eco.weight object can be created with a custom W matrix. In this case,
##D ## the rows and the columns of W (weight matrix) must have names, 
##D ## that must coincide (also in order) with the name of the XY (position) matrix.
##D 
##D require(igraph)
##D ## this example generates a network with the package igraph
##D tr <- make_tree(40, children = 3, mode = "undirected")
##D plot(tr, vertex.size = 10, vertex.label = NA) 
##D 
##D ## conversion from igraph to weight matrix 
##D weights <- as.matrix(as_adj(tr))
##D 
##D ## weight matrix requires named rows and columns
##D myNames <- 1:nrow(weights)
##D rownames(weights) <- colnames(weights) <-  myNames
##D 
##D ## extract coordinates from the igraph object 
##D coord <- layout.auto(tr)
##D rownames(coord) <- myNames
##D plot(layout.auto(tr))
##D 
##D ## custom weight object
##D customw <- eco.weight(XY = coord, W = weights)
##D 
##D ## simple plot of the object
##D eco.plotWeight(customw, type = "simple")
##D 
##D ## create a vector with groups to have coloured plots
##D myColors <- c(rep(1,13), rep(2, 9), rep(3, 9), rep(4, 9))
##D 
##D eco.plotWeight(customw, type = "igraph",group = myColors)
##D 
##D ## in the following plot, the argument bounded is set to FALSE, 
##D ## but if you have many groups, it probably should be set to TRUE.
##D # click in a node to see the label
##D eco.plotWeight(customw,type = "network", bounded = FALSE, group = myColors)
##D 
##D ## in the following plot, the assignment a group factor, 
##D # generates clustered nodes.
##D # hover over the name of the nodes to see the individual connections
##D eco.plotWeight(customw,  type = "edgebundle", group = myColors)
##D 
##D 
##D #### CONVERSION FROM LISTW OBJECTS #####
##D require(adegenet)
##D # Delaunay triangulation
##D temp <-chooseCN(eco3[["XY"]], type = 1, result.type = "listw", plot.nb = FALSE)
##D con <- eco.listw2ew(temp)
##D eco.plotWeight(con, "network", bounded = TRUE, group = eco3[["S"]]$structure)
##D 
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.METHOD(con)        # slot METHOD
##D ecoslot.PAR(con)           # slot PAR
##D ecoslot.PAR.VAL(con)       # slot PAR.VAL
##D 
## End(Not run)




