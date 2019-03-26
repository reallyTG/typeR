library(KODAMA)


### Name: floyd
### Title: Find Shortest Paths Between All Nodes in a Graph
### Aliases: floyd

### ** Examples

# build a graph with 5 nodes
x=matrix(c(0,NA,NA,NA,NA,30,0,NA,NA,NA,10,NA,0,NA,NA,NA,70,50,0,10,NA,40,20,60,0),ncol=5)
print(x)

# compute all path lengths
z=floyd(x)
print(z)




