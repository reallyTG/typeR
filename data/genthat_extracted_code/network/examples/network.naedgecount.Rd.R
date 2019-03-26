library(network)


### Name: missing.edges
### Title: Identifying and Counting Missing Edges in a Network Object
### Aliases: network.naedgecount is.na.network missing.edges
### Keywords: classes graphs

### ** Examples

#Create an empty network with no missing data
g<-network.initialize(5)
g[,]                        #No edges present....
network.naedgecount(g)==0   #Edges not present are not "missing"!

#Now, add some missing edges
g[1,,add.edges=TRUE]<-NA    #Establish that 1's ties are unknown
g[,]                        #Observe the missing elements
is.na(g)                    #Observe in network form
network.naedgecount(g)==4   #These elements do count!
network.edgecount(is.na(g)) #Same as above





