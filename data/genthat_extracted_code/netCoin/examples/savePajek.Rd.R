library(netCoin)


### Name: savePajek
### Title: Save a netCoin object as a .net (.paj) file to be read in Pajek,
###   Gephi, ...
### Aliases: savePajek

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", add=FALSE, sep = "; ")
graph <- allNet(data) # graph from an incidence matrix

savePajek(graph,"graph",edges="Haberman") # save graph.net file



