library(cg)


### Name: profileGraph.cgPairedDifferenceData
### Title: Graph Profiles of Experimental Unit Pairs in a
###   cgPairedDifferenceData object
### Aliases: profileGraph,cgPairedDifferenceData-method
###   profileGraph.cgPairedDifferenceData

### ** Examples

data(anorexia.FT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
profileGraph(anorexiaFT.data) 

# Graph the data on the original scale instead of the log scale.
profileGraph(anorexiaFT.data, logscale=FALSE)



