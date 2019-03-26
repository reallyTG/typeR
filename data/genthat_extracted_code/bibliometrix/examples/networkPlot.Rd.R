library(bibliometrix)


### Name: networkPlot
### Title: Plotting Bibliographic networks
### Aliases: networkPlot

### ** Examples

# EXAMPLE Co-citation network

data(scientometrics)

NetMatrix <- biblioNetwork(scientometrics, analysis = "co-citation", 
network = "references", sep = ";")

net <- networkPlot(NetMatrix, n = 30, type = "kamada", Title = "Co-Citation",labelsize=0.5) 




