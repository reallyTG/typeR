library(SEAsic)


### Name: resd
### Title: Root Expected Square Difference
### Aliases: resd

### ** Examples

#Unstandardized RESD for subpopulation 1 in the example data set, ex.data
resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],f=ex.data[,8])

#Unstandardized RESD for subpopulation 5 in the example data set, ex.data
resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],f=ex.data[,8])

#Standardized RESD for subpopulation 5 in the example data set, ex.data
resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],f=ex.data[,8],s=4.2)



