library(orca)


### Name: orca
### Title: Orbit counting
### Aliases: count4 count5 ecount4 ecount5
### Keywords: graphs

### ** Examples


library(orca)

# Load and show the orbit counts for the Karate graph
data("karate")
count4(karate)


## Not run: 
##D # Simple analysis of School Wikipedia network: find the most similar
##D # nodes with respect to the local network topology
##D # Requires data from http://www.biolab.si/supp/Rorca/_downloads/schools-wiki.zip
##D 
##D library("FNN")
##D 
##D nodes <- scan("schools-wiki-nodes.txt", what="", sep="\n")
##D edges <- read.table("schools-wiki-edges.txt")
##D 
##D orbits <- count4(edges)
##D nn <- get.knn(orbits, k=10)
##D neighbours <- nn$nn.index
##D distances <- nn$nn.dist
##D 
##D check <- c("Canada", "Germany", "Isaac Newton", "Albert Einstein",
##D            "Mahatma Gandhi", "Mahabharata")
##D node_indices <- match(check, nodes)
##D for (i in 1:length(check)) {
##D     cat("\n\n", check[i], ": ", sep="")
##D     cat(nodes[neighbours[node_indices[i], ]], sep=", ")
##D     cat("\n")
##D     cat(round(distances[node_indices[i], ]), sep=", ")
##D }
## End(Not run)



