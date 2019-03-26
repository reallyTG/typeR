library(SitesInterest)


### Name: plot.hoops
### Title: Plots the trajectory with sites of interest and other hoops
### Aliases: plot.hoops
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

class(X) = "hoops"
class(Y) = "hoops"

##Calculate the residence time with a radius of 0.3 and not including the first circle
Alt_Alg("OU_14",t,X,Y,0.3,first='y',save='y')

##Plot the positions of the identified sites as well as the non-overlapping circles
plot(X,Y,"OU_14",0.3)

##The colours for the hoops can be changed
plot(X,Y,"OU_14",0.3,first='y',colours=c('tan','chocolate','maroon'))

##The thickness of hoops can also be changed
plot(X,Y,"OU_14",0.3,first='y',lwds=c(0.5,2,3.5))

##It is also possible to manually choose the number of sites
plot(X,Y,"OU_14",0.3,first='y',number_sites=4)

##Reset the original working directory
setwd(wd)
## End(No test)



