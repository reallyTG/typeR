library(SitesInterest)


### Name: plot_bars_and_hoops
### Title: Plots both the bar chart and hoops plot in one figure
### Aliases: plot_bars_and_hoops
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

class(X) <- "bars_and_hoops"
class(Y) <- "bars_and_hoops"

##Calculate the residence time with a radius of 0.3 and not including the first circle
Alt_Alg("OU_14",t,X,Y,0.3,first='y',save='y')

##Plot the bar chart of ranked non-overlapping residence times and the plot showing
##the positions of these circles
plot_bars_and_hoops(X,Y,"OU_14",0.3,first='y')

##Reset the original working directory
setwd(wd)
## End(No test)



