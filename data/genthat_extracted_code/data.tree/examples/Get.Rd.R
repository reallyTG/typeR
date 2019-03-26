library(data.tree)


### Name: Get
### Title: Traverse a Tree and Collect Values
### Aliases: Get

### ** Examples

data(acme)
acme$Get("level")
acme$Get("totalCount")
 

acme$Get(function(node) node$cost * node$p,
         filterFun = isLeaf)

#This is equivalent:
nodes <- Traverse(acme, filterFun = isLeaf)
Get(nodes, function(node) node$cost * node$p)

   
#simplify = "regular" will preserve names
acme$Get(function(x) c(position = x$position, level = x$level), simplify = "regular")
 



