library(SEAsic)


### Name: madp
### Title: Mean Absolute Difference for Pairs
### Aliases: madp

### ** Examples

#Unstandardized MAD for subpopulation 1 and subpopulation 2 in the example data set, ex.data
madp(x=ex.data[,1],g1=ex.data[,3],g2=ex.data[,4],f=ex.data[,8])

#Unstandardized MAD for subpopulation 4 and subpopulation 5 in the example data set, ex.data
madp(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],f=ex.data[,8])

#Standardized MAD for subpopulation 4 and subpopulation 5 in the example data set, ex.data
madp(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],f=ex.data[,8],s=4.2)



