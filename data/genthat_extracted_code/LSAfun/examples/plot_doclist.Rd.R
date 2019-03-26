library(LSAfun)


### Name: plot_doclist
### Title: 2D- or 3D-Plot of a list of sentences/documents
### Aliases: plot_doclist

### ** Examples
data(wonderland)

## Standard Plot

docs <- c("Alice was beginning to get very tired.",
          "The red queen greeted Alice.",
          "The mad hatter and the mare hare are having a party.",
          "The hatter sliced the cup of tea in half.")
          
plot_doclist(docs,tvectors=wonderland,method="MDS",dims=2)




