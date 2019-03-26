library(bibliometrix)


### Name: biblioNetwork
### Title: Creating Bibliographic networks
### Aliases: biblioNetwork

### ** Examples

# EXAMPLE 1: Authors collaboration network

# data(scientometrics)

# NetMatrix <- biblioNetwork(scientometrics, analysis = "collaboration", 
# network = "authors", sep = ";")

# net <- networkPlot(NetMatrix, n = 30, type = "kamada", Title = "Collaboration",labelsize=0.5) 


# EXAMPLE 2: Co-citation network

data(scientometrics)

NetMatrix <- biblioNetwork(scientometrics, analysis = "co-citation", 
network = "references", sep = ";")

net <- networkPlot(NetMatrix, n = 30, type = "kamada", Title = "Co-Citation",labelsize=0.5) 




