library(SEAsic)


### Name: rmsd
### Title: Root Mean Square Difference
### Aliases: rmsd

### ** Examples

#Unstandardized RMSD for subpopulations 1 and 2 in the example data set, ex.data, 
#assuming equal weights for the subpopulations
rmsd(x=ex.data[,1],o=ex.data[,2],g=c(ex.data[,3],ex.data[,4]),w=c(.5,.5),d=.5)

#Unstandardized RMSD for all five subpopulations in the example data set, ex.data
rmsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
w=c(.1,.2,.4,.2,.1),d=.5)

#Unstandardized RMSD for all five subpopulations in the example data set, ex.data, 
#with adjustments to the maximum y-axis on the plot, a new xlabel, 
#and points/line in blue
rmsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
w=c(.1,.2,.4,.2,.1),d=.5,ymax=3,xlab="Old Form",color="blue")

#Standardized RMSD for all five subpopulations in the example data set, ex.data
rmsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
w=c(.1,.2,.4,.2,.1),d=.5,s=4.2)



