library(gbutils)


### Name: adjacencyOfClasses
### Title: Adjacency graph of classes in packages
### Aliases: adjacencyOfClasses
### Keywords: programming S4classes

### ** Examples

adjacencyOfClasses("gbutils")
adjacencyOfClasses("gbutils", TRUE)

adjacencyOfClasses("gbutils", FALSE, "matrixOfPairs")
adjacencyOfClasses("gbutils", TRUE,  "matrixOfPairs")

adjacencyOfClasses("gbutils", FALSE, "adjacencyMatrix")
adjacencyOfClasses("gbutils", TRUE,  "adjacencyMatrix")

## as above, also represent the graph using the edges
adjacencyOfClasses("gbutils", Wolfram = TRUE)
adjacencyOfClasses("gbutils", TRUE, Wolfram = TRUE)

## here the graph is represented by the adjacency matrix: 
adjacencyOfClasses("gbutils", FALSE, "adjacencyMatrix", Wolfram = TRUE)
adjacencyOfClasses("gbutils", TRUE,  "adjacencyMatrix", Wolfram = TRUE)

if(requireNamespace("graph") && requireNamespace("Rgraphviz")) withAutoprint({
    ## another package
    adjacencyOfClasses("graph")
    ac1 <- adjacencyOfClasses("graph", FALSE, "adjacencyMatrix")
    gr_ac1 <- graph::graphAM(adjMat = ac1$AM, edgemode = "directed")
    if(require("Rgraphviz"))
        plot(gr_ac1)
    ## more than one package
    ac2 <- adjacencyOfClasses(c("graph", "Rgraphviz"), FALSE, "adjacencyMatrix")
    gr_ac2 <- graph::graphAM(adjMat = ac2$AM, edgemode = "directed")
    if(require("Rgraphviz"))
        plot(gr_ac2)
})



