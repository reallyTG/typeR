library(SEAsic)


### Name: dx
### Title: Difference for Pairs - D(x)
### Aliases: dx

### ** Examples

#Unstandardized D(x) for subpopulation 1 and subpopulation 2 in the example data set, ex.data
dx(x=ex.data[,1],g1=ex.data[,3],g2=ex.data[,4],d=.5)

#Unstandardized D(x) for subpopulation 1 and subpopulation 2 in the example data set, ex.data, 
#with adjustments to the maximum y-axis on the plot, a new xlabel, and points/line in blue.
dx(x=ex.data[,1],g1=ex.data[,3],g2=ex.data[,4],d=.5,ymax=2,xlab="AD(x)",color="blue")

#Unstandardized D(x) for subpopulation 4 and subpopulation 5 in the example data set, ex.data
dx(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],d=.5)

#Standardized D(x) for subpopulation 4 and subpopulation 5 in the example data set, ex.data
dx(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],d=.5,s=4.2)



