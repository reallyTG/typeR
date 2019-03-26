library(SEAsic)


### Name: rsd
### Title: Root Square Difference
### Aliases: rsd

### ** Examples

#Unstandardized RSD for subpopulation 1 in the example data set, ex.data
rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],d=.5)

#Unstandardized RSD for subpopulation 5 in the example data set, ex.data
rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5)

#Unstandardized RSD for subpopulation 5 in the example data set, ex.data 
#with adjustments to the maximum y-axis on the plot, a new x label, 
#and points/line in green
rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5,ymax=3,xlab="Old Form",color="green")

#Standardized RSD for subpopulation 5 in the example data set, ex.data
rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5,s=4.2)



