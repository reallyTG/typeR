library(SEAsic)


### Name: emaxd
### Title: Expected Maximum Difference
### Aliases: emaxd

### ** Examples

#Unstandardized EMAXD across subpopulation 1 and subpopulation 2 in the example data set, ex.data
emaxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4]),
n=2,f=ex.data[,8])

#Unstandardized EMAXD across subpopulations 1 thru 5 in the example data set, ex.data
emaxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
n=5,f=ex.data[,8])

#Standardized EMAXD across subpopulations 1 thru 5 in the example data set, ex.data
emaxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
n=5,f=ex.data[,8],s=4.2)



