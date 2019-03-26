library(comato)


### Name: pathfinder.matrix
### Title: Creating a Pathfinder network from a matrix
### Aliases: pathfinder.matrix

### ** Examples

#Manually create a weighted graph
data = matrix(data = 0, nrow = 6, ncol=6)
colnames(data) <- c("Object", "Class", "Method", "Attribute", "Visibility", "Algorithm")
rownames(data) <- c("Object", "Class", "Method", "Attribute", "Visibility", "Algorithm")
data["Object", "Class"] = 3
data["Object", "Method"] = 3
data["Object", "Attribute"] = 10
data["Object", "Visibility"] = Inf
data["Object", "Algorithm"] = 9
data["Class", "Method"] = 7
data["Class", "Attribute"] = 6
data["Class", "Visibility"] = 8
data["Class", "Algorithm"] = 10
data["Method", "Attribute"] = 4
data["Method", "Visibility"] = 9
data["Method", "Algorithm"] = 3
data["Attribute", "Visibility"] = 5
data["Attribute", "Algorithm"] = 10
data["Visibility", "Algorithm"] = Inf

data = data + t(data)

#Run the Pathfinder algorithm with several different parameters
pathfinder(data, 5, 1)
pathfinder(data, 2, 1)
pathfinder(data, 5,Inf)
pathfinder(data, 2, Inf)



