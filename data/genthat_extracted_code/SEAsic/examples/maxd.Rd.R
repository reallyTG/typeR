library(SEAsic)


### Name: maxd
### Title: Maximum Difference
### Aliases: maxd

### ** Examples

#Unstandardized MAXD across subpopulation 1 and subpopulation 2 in the example data set, ex.data
maxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4]),
n=2,d=.5)

#Unstandardized MAXD across subpopulations 1 thru 5 in the example data set, ex.data
maxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
n=5,d=.5)

#Standardized MAXD across subpopulations 1 thru 5 in the example data set, ex.data
maxd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
n=5,d=.5,s=4.2)



