library(SEAsic)


### Name: remsd
### Title: Root Expected Mean Square Difference
### Aliases: remsd

### ** Examples

#Unstandardized REMSD for subpopulations 1 and 2 in the example data set, ex.data, 
#assuming equal weights for the subpopulations
remsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4]),f=ex.data[,8],w=c(.5,.5))

#Unstandardized REMSD for all five subpopulations in the example data set, ex.data
remsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
f=ex.data[,8],w=c(.1,.2,.4,.2,.1))

#Standardized REMSD for all five subpopulations in the example data set, ex.data
remsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
f=ex.data[,8],w=c(.1,.2,.4,.2,.1),s=4.2)



