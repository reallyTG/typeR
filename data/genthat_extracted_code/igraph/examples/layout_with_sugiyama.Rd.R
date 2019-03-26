library(igraph)


### Name: layout_with_sugiyama
### Title: The Sugiyama graph layout generator
### Aliases: layout_with_sugiyama layout.sugiyama with_sugiyama
### Keywords: graphs

### ** Examples


## Data taken from http://tehnick-8.narod.ru/dc_clients/
DC <- graph_from_literal("DC++" -+
                "LinuxDC++":"BCDC++":"EiskaltDC++":"StrongDC++":"DiCe!++",
                "LinuxDC++" -+ "FreeDC++", "BCDC++" -+ "StrongDC++",
                "FreeDC++" -+ "BMDC++":"EiskaltDC++",
                "StrongDC++" -+ "AirDC++":"zK++":"ApexDC++":"TkDC++",
                "StrongDC++" -+ "StrongDC++ SQLite":"RSX++",
                "ApexDC++" -+ "FlylinkDC++ ver <= 4xx",
                "ApexDC++" -+ "ApexDC++ Speed-Mod":"DiCe!++",
                "StrongDC++ SQLite" -+ "FlylinkDC++ ver >= 5xx",
                "ApexDC++ Speed-Mod" -+ "FlylinkDC++ ver <= 4xx",
                "ApexDC++ Speed-Mod" -+ "GreylinkDC++",
                "FlylinkDC++ ver <= 4xx" -+ "FlylinkDC++ ver >= 5xx",
                "FlylinkDC++ ver <= 4xx" -+ AvaLink,
                "GreylinkDC++" -+ AvaLink:"RayLinkDC++":"SparkDC++":PeLink)

## Use edge types
E(DC)$lty <- 1
E(DC)["BCDC++" %->% "StrongDC++"]$lty <- 2
E(DC)["FreeDC++" %->% "EiskaltDC++"]$lty <- 2
E(DC)["ApexDC++" %->% "FlylinkDC++ ver <= 4xx"]$lty <- 2
E(DC)["ApexDC++" %->% "DiCe!++"]$lty <- 2
E(DC)["StrongDC++ SQLite" %->% "FlylinkDC++ ver >= 5xx"]$lty <- 2
E(DC)["GreylinkDC++" %->% "AvaLink"]$lty <- 2

## Layers, as on the plot
layers <- list(c("DC++"),
               c("LinuxDC++", "BCDC++"),
               c("FreeDC++", "StrongDC++"),
               c("BMDC++", "EiskaltDC++", "AirDC++", "zK++", "ApexDC++",
                 "TkDC++", "RSX++"),
               c("StrongDC++ SQLite", "ApexDC++ Speed-Mod", "DiCe!++"),
               c("FlylinkDC++ ver <= 4xx", "GreylinkDC++"),
               c("FlylinkDC++ ver >= 5xx", "AvaLink", "RayLinkDC++",
                 "SparkDC++", "PeLink"))

## Check that we have all nodes
all(sort(unlist(layers)) == sort(V(DC)$name))

## Add some graphical parameters
V(DC)$color <- "white"
V(DC)$shape <- "rectangle"
V(DC)$size <- 20
V(DC)$size2 <- 10
V(DC)$label <- lapply(V(DC)$name, function(x)
                      paste(strwrap(x, 12), collapse="\n"))
E(DC)$arrow.size <- 0.5

## Create a similar layout using the predefined layers
lay1 <-  layout_with_sugiyama(DC, layers=apply(sapply(layers,
                        function(x) V(DC)$name %in% x), 1, which))

## Simple plot, not very nice
par(mar=rep(.1, 4))
plot(DC, layout=lay1$layout, vertex.label.cex=0.5)

## Sugiyama plot
plot(lay1$extd_graph, vertex.label.cex=0.5)

## The same with automatic layer calculation
## Keep vertex/edge attributes in the extended graph
lay2 <-  layout_with_sugiyama(DC, attributes="all")
plot(lay2$extd_graph, vertex.label.cex=0.5)

## Another example, from the following paper:
## Markus Eiglsperger, Martin Siebenhaller, Michael Kaufmann:
## An Efficient Implementation of Sugiyama's Algorithm for
## Layered Graph Drawing, Journal of Graph Algorithms and
## Applications 9, 305--325 (2005).

ex <- graph_from_literal( 0 -+ 29: 6: 5:20: 4,
                 1 -+ 12,
                 2 -+ 23: 8,
                 3 -+  4,
                 4,
                 5 -+  2:10:14:26: 4: 3,
                 6 -+  9:29:25:21:13,
                 7,
                 8 -+ 20:16,
                 9 -+ 28: 4,
                10 -+ 27,
                11 -+  9:16,
                12 -+  9:19,
                13 -+ 20,
                14 -+ 10,
                15 -+ 16:27,
                16 -+ 27,
                17 -+  3,
                18 -+ 13,
                19 -+  9,
                20 -+  4,
                21 -+ 22,
                22 -+  8: 9,
                23 -+  9:24,
                24 -+ 12:15:28,
                25 -+ 11,
                26 -+ 18,
                27 -+ 13:19,
                28 -+  7,
                29 -+ 25                    )

layers <- list( 0, c(5, 17), c(2, 14, 26, 3), c(23, 10, 18), c(1, 24),
                12, 6, c(29,21), c(25,22), c(11,8,15), 16, 27, c(13,19),
                c(9, 20), c(4, 28), 7 )

layex <-  layout_with_sugiyama(ex, layers=apply(sapply(layers,
                        function(x) V(ex)$name %in% as.character(x)),
                        1, which))

origvert <- c(rep(TRUE, vcount(ex)), rep(FALSE, nrow(layex$layout.dummy)))
realedge <- as_edgelist(layex$extd_graph)[,2] <= vcount(ex)
plot(layex$extd_graph, vertex.label.cex=0.5,
     edge.arrow.size=.5,
     vertex.size=ifelse(origvert, 5, 0),
     vertex.shape=ifelse(origvert, "square", "none"),
     vertex.label=ifelse(origvert, V(ex)$name, ""),
     edge.arrow.mode=ifelse(realedge, 2, 0))




