library(dynamicGraph)


### Name: DynamicGraph
### Title: DEPRECATED: Simple interface to dynamicGraph
### Aliases: DynamicGraph
### Keywords: dplot hplot iplot dynamic graphs methods multivariate

### ** Examples

require(tcltk); require(dynamicGraph)

# Example 1:

W <- dg(as(new("dg.simple.graph", vertex.names = 1:5), "dg.graph"),
        control = dg.control(title = "Very simple"))

# Example 2:

W <- dg(new("dg.simple.graph", from = 1:4, to = c(2:4, 1)), 
        control = dg.control(title = "Simply edges"))

# Example 3:

V.Types <- c("Discrete", "Ordinal", "Discrete",
             "Continuous", "Discrete", "Continuous")

V.Names  <- c("Sex", "Age", "Eye", "FEV", "Hair", "Shosize")
V.Labels <- paste(V.Names, 1:6, sep ="/")

From <- c(1, 2, 3, 4, 5, 6)
To   <- c(2, 3, 4, 5, 6, 1)

W <- dg(new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
            labels = V.Labels, from = From, to = To), 
        control = dg.control(title = "With labels (extraVertices)"))


# Example 4: Oriented (cyclic) edges, without causal structure:

W <- dg(new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
            labels = V.Labels, from = From, to = To, oriented = TRUE),
        control = dg.control(title = "Oriented edges"))


# Example 5: A factor graph:

Factors <- list(c(1, 2, 3, 4), c(3, 4, 5), c(4, 5, 6))

W <- dg(new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
          labels = V.Labels, factors = Factors, viewType = "Factor"),
        control = dg.control(title = "Factorgraph", namesOnEdges = FALSE))


# Example 6: Edges with more than two vertices:

EdgeList <- list(c(1, 2, 3, 4), c(3, 4, 5), c(4, 5, 6))

W <- dg(new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
          labels = V.Labels, edge.list = EdgeList),
        control = dg.control(title = "Multiple edges", namesOnEdges = FALSE))

W



