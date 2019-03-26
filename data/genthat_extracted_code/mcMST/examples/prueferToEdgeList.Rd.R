library(mcMST)


### Name: prueferToEdgeList
### Title: Convert Pruefer code to edge list.
### Aliases: prueferToEdgeList

### ** Examples

# here we generate a random Pruefer-code representing
# a random spanning tree of a graph with n = 10 nodes
pcode = sample(1:10, 8, replace = TRUE)
print(pcode)
edgelist = prueferToEdgeList(pcode)
print(edgelist)



