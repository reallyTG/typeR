library(kml)


### Name: choice
### Title: ~ Function: choice ~
### Aliases: choice [,ParChoice-method choice,ClusterLongData-method
### Keywords: iplot chron spatial classif cluster nonparametric ts

### ** Examples

### Creation of articficial data
cld1 <- gald(25)

### Clusterisation
kml(cld1,3:5,nbRedrawing=2,toPlot='both')

### Selection of the clustering we want
#     (note that "try" is for compatibility with CRAN only,
#     you probably can use "choice(cld1)")
try(choice(cld1))



