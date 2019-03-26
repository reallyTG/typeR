library(simba)


### Encoding: UTF-8

### Name: sim
### Title: Calculate similarities for binary vegetation data
### Aliases: sim
### Keywords: methods multivariate

### ** Examples

data(abis)
##calculate jaccard similarity and output as dist-object
jacc.dist <- sim(abis.spec, method="jaccard") 

##calculate Whittaker similarity (with prior normalisation) and 
##output as data.frame
whitt.list <- sim(abis.spec, method="whittaker", normalize=TRUE, 
listout=TRUE) 

##calculate similarity from a database list after Harte & Kinzig (1997) 
##and output as dist-object
abis.spec.ls <- liste(abis.spec, splist=TRUE)
hart.dist <- sim(abis.spec.ls, method="harte", listin=TRUE) 

## calculate the geographic distances between sites simultaneously
## and return only similarities calculated between neighboring plots
abis.soer <- sim(abis.spec, coord=abis.env[,1:2], dn=100)

## in an equidistant array
## you can plot this nice between the original positions of the
## sites (with the size of the dots expressing number of species
## for the sites, and value of the Sørensen coefficient in between)
require(geoR)
points.geodata(coord=abis.env[,1:2], data=abis.env$n.spec, 
cex.min=1, cex.max=5)
points.geodata(coord=abis.soer[,5:6], data=abis.soer$soerensen, 
cex.min=1, cex.max=5, col="grey50", add=TRUE)




