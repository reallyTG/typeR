library(cg)


### Name: diffGraph
### Title: Graph Paired Differences
### Aliases: diffGraph

### ** Examples

data(anorexia.FT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
diffGraph(anorexiaFT.data) 

# Graph the data on the original scale instead of the log scale.
diffGraph(anorexiaFT.data, logscale=FALSE)



