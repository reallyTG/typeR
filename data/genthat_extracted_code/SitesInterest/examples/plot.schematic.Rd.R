library(SitesInterest)


### Name: plot.schematic
### Title: Plots a schematic representation of the movement trajectory
### Aliases: plot.schematic
### Keywords: Plots

### ** Examples

## No test: 
##Find the current working directory
wd = getwd()
##Set the working directory as the temporary one
setwd(tempdir())
##Load the data
data(OU_14)
t=unlist(OU_14["t"])
X=unlist(OU_14["X"])
Y=unlist(OU_14["Y"])

class(X) = "schematic"
class(Y) = "schematic"

##Calculate the residence time with a radius of 0.3 and not including the first circle
Alt_Alg("OU_14",t,X,Y,0.3,first='y',save='y')

##Plot the schematic representation of movements between sites
plot(X,Y,"OU_14",0.3,first='y')

##There is also the option to make changes to:
##the length of the arrow head
plot(X,Y,"OU_14",0.3,first='y',len_arrow=0.25)

##the thickness of the arrow
plot(X,Y,"OU_14",0.3,first='y',lwd_arrow=2)

##the thickness of the hoops
plot(X,Y,"OU_14",0.3,first='y',lwd_r=2)

##the size of the arrow labels
plot(X,Y,"OU_14",0.3,first='y',text_size=2)

##the location of the legend
plot(X,Y,"OU_14",0.3,first='y',legend_loc="bottomleft")

##Reset the original working directory
setwd(wd)
## End(No test)



